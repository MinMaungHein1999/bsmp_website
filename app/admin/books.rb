
ActiveAdmin.register Book do
  
  permit_params do
    permitted = [:title, :cover_photo, :pdf_file, :description, author_ids: [], category_ids: []]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column "Cover Photo" do |book|
      if !book.cover_photo_url.nil?
        image_tag book.cover_photo_url, class: 'my_image_size'
      end
    end
    
    column "Title" do |book|
      link_to book.title, admin_book_path(book.id)
    end

    column "Category" do |book|
      book.categories
    end

    column "Authors" do |book|
      book.authors
    end
  
    column :Description do |book|
      book.description.body
    end
    column :created_at
    column :updated_at
    column "PDF File" do |book| 
      if !book.pdf_file_url.nil?
        link_to "Download", book.pdf_file_url 
      end
    end

    actions defaults: true do |book|
      if book.published_date.nil?
        item "<i class='fas fa-times'></i> Publish".html_safe, run_admin_book_path(book), method: :get, class: 'publish_button'
      end
    end
  end

  



  show do
    attributes_table do
      
      row :title
      row :published_date
      row :Description do |book|
        book.description.body
      end
      row :created_at
      row :updated_at

      row :pdf_file do |book| 
        if !book.pdf_file_url.nil?
          link_to "Download", book.pdf_file_url 
        end
      end

      row :cover_photo do |book|
        image_tag book.cover_photo_url, class: 'my_image_lg_size'
      end
    end
    active_admin_comments
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :author_ids, as: :check_boxes, collection: Author.all.map{|x| [x.name, x.id]}
      f.input :category_ids, as: :check_boxes, collection: Category.all.map{|x| [x.name, x.id]}
      f.input :cover_photo, as: :file, hint: f.object.cover_photo.attached? ? image_tag(f.object.cover_photo.variant(resize: "100x100")) : nil
      f.input :pdf_file, as: :file
      f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link']] }, placeholder: 'Type something...', theme: 'snow' } } }
    end
    f.actions
  end

  member_action :run, method: :get do
    resource.publish_book
    redirect_to collection_path, notice: "Sending emails to each Subscriber!!!"
  end
end

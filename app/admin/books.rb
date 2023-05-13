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
    column "PDF File" do |book| 
      if !book.pdf_file_url.nil?
        link_to "Download", book.pdf_file_url 
      end
    end
    column :title
    column :Description do |book|
      book.description.body
    end
    column :created_at
    column :updated_at
    actions
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
      f.input :category_ids, as: :check_boxes, collection: Category.all.map{|x| [x.category_name, x.id]}
      f.input :cover_photo, as: :file
      f.input :pdf_file, as: :file
      f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link']] }, placeholder: 'Type something...', theme: 'snow' } } }
    end
    f.actions
  end
  
end

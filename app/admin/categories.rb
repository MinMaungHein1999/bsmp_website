ActiveAdmin.register Category do

  index do
    selectable_column
    id_column
  
    column "Title" do |category|
      link_to category.name, admin_category_path(category.id)
    end


    column "Books" do |category|
      content_tag :ol, class: 'orders-list' do
        category.books.each do |book|
          concat content_tag(:li, link_to(book.title, admin_book_path(book.id)),class: "order-item")
        end
      end
    end
  
    column :created_at
    column :updated_at
    actions
  end


  show do
    attributes_table do
      row :id
      row :name
      row :created_at 
      row :updated_at
    end

    panel "Category's Books" do
      table_for category.books do
        
        column "Id" do |book|
          link_to book.id, admin_book_path(book.id)
        end
      
        column "Cover Photo" do |book|
          if !book.cover_photo_url.nil?
            image_tag book.cover_photo_url, class: 'my_image_size'
          end
        end
       

        column "Title" do |book|
          link_to book.title, admin_book_path(book.id)
        end
      
        column "Authors" do |book|
          content_tag :ol, class: 'orders-list' do
            book.authors.each do |author|
              concat content_tag(:li, link_to(author.name, admin_author_path(author.id)),class: "order-item")
            end
          end
        end

        column :status do |book|
          if book.published_date.nil?
            link_to("Publish", run_admin_book_path(book), class: "publish-button")
          else
             "published"
          end
        end
      

        column "PDF File", class: "pdf-file" do |book|
          if !book.pdf_file_url.nil?
            link_to "Download", book.pdf_file_url, class: "download-link"
          end
        end


        column :created_at
        column :updated_at
        
      end
    end
    active_admin_comments
  end


  permit_params do
    permitted = [:name]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end
  
end

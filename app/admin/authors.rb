ActiveAdmin.register Author do
  permit_params do
    permitted = [:name, :email, :phone, :address, :profile]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column "Profile" do |author|
      image_tag author.profile_url, class: 'my_image_size'
    end
    column "Name" do |author|
      link_to author.name, admin_author_path(author.id)
    end

    column "Books" do |author|
      author.books
    end
    
    column :email
    column :phone
    column :address
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name 
      row :email
      row :phone 
      row :address 
      row :created_at 
      row :updated_at
      row :image do |author|
        image_tag author.profile_url, class: 'my_image_lg_size'
      end
    end

    panel "Author's Books" do
      table_for author.books do
        
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
      
        column :Description do |book|
          book.description.body
        end

        column "PDF File" do |book| 
          if !book.pdf_file_url.nil?
            link_to "Download", book.pdf_file_url 
          end
        end

        column :created_at
        column :updated_at
        
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :address
      f.input :profile, as: :file, hint: f.object.profile.attached? ? image_tag(f.object.profile.variant(resize: "100x100")) : nil
    end
    f.actions
  end
  
end

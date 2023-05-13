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
    column :name
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
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :address
      f.input :profile, as: :file
    end
    f.actions
  end
  
end

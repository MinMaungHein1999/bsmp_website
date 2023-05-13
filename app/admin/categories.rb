ActiveAdmin.register Category do
  permit_params do
    permitted = [:name]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end
  
end

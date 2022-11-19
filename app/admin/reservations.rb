ActiveAdmin.register Reservation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :firstname, :lastname, :phone, :day, :rut, :email, :user_id, :work_day_id, :block_time_id, :worker_id, :service_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:firstname, :lastname, :phone, :day, :rut, :email, :user_id, :work_day_id, :block_time_id, :worker_id, :service_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

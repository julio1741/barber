ActiveAdmin.register Worker do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :instagram, :image_url, :description, :phone
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :instagram, :image_url, :description, :phone]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Doctor information' do
      f.input :name
      f.input :instagram
      f.input :image_url
      f.input :description
      f.input :phone
      f.input :work_days, as: :check_boxes
      f.input :block_times, as: :check_boxes,
                            member_label: proc { |c|
                                            "#{c.start.strftime('%I:%M %p')} #{c.end.strftime('%I:%M %p')}"
                                          }
    end

    f.actions
  end
  
end

ActiveAdmin.register User do

  # ActiveAdmin.register Post do
  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
     render "admin/student/student"
  end

  collection_action :import_csv, :method => :post do
    
    CsvDb.convert_save("user", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV uploaded successfully!"
  end

end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :gender, :age, :birthdate, :address
  
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :gender, :age, :birthdate, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  




class Api::V1::UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]


def index
	@users = User.all
	render json: @users
end

# def import_users
#     if upload_params[:user_csv].content_type.include?('csv')
#       csv_text = File.read(upload_params[:user_csv].tempfile)
#       csv = CSV.parse(csv_text, headers: true)
#       csv.each do |row|
#         User.create(first_name: row[0], last_name: row[1], gender: row[2], birthdate: row[3], address: row[4], role: upload_params[:role] )
#       end
#       redirect_to users_path
#     else
#       redirect_to users_path
#     end
#   end


def show
	render json: @user

end


def create
	@user = User.new(user_params)
	if @user.save
      render json: { user: @user }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
end

def update
	 if @user.update(user_params)
      render json: { user: @user }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
 end

 def destroy
 	@user.destroy
 end

private
def user_params
    params.require(:user).permit(:first_name, :last_name )
  end

 def set_user
    @user = User.find(params[:id])
 end

end
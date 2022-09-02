class Api::V1::EducationsController < ApplicationController
	before_action :set_education, only: [:show, :update, :destroy]


def index
	@educations  = Educations.all
	render json: @educations
end

def show
	render json: @education

end


def create
	@education = Education.new(education_params)
	if @education.save
      render json: { education: @education }, status: :created
    else
      render json: @education.errors, status: :unprocessable_entity
    end
end

def update
	 if @education.update(education_params)
      render json: { education: @education }
    else
      render json: @education.errors, status: :unprocessable_entity
    end
 end

 def destroy
 	@education.destroy
 end

private
def education_params
    params.require(:education).permit(:marks :percentage )
  end

 def set_education
    @education = education.find(params[:id])
 end
end


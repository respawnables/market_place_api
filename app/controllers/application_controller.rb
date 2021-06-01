class ApplicationController < ActionController::API
  
  # GET /users/1
  def show
    render json: User.find(params[:id])
  end
end

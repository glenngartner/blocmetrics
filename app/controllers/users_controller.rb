class UsersController < ApplicationController
  def create
  end

  def destroy
  end

  # def edit
  # end

  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @registered_applications = @user.registered_applications.find(params[:id])
  end

  def update
  end
end

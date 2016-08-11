class WelcomeController < ApplicationController
  def index
    @user = User.where("id = #{current_user.id}")
  end
end

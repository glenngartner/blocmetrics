class RegisteredApplicationsController < ApplicationController
    def new
        @reg_app = RegisteredApplication.new
    end

    def create
        @reg_app = RegisteredApplication.new
        @reg_app.name = params[:registered_application][:name]
        @reg_app.url = params[:registered_application][:url]
        @reg_app.user_id = current_user.id

        if @reg_app.save
            flash[:notice] = 'App was saved successfully'
            redirect_to registered_applications_path

        else

            flash.now[:alert] = 'There was an error saving the app. Please try again.'
            render :new
        end
    end

    def edit
        @reg_app = RegisteredApplication.find(params[:id])
    end

    def update
        @reg_app = RegisteredApplication.find(params[:id])
        @reg_app.name = params[:registered_application][:name]
        @reg_app.url = params[:registered_application][:url]
        @reg_app.user_id = current_user.id

        if @reg_app.save
            flash[:notice] = 'App was updated successfully'
            redirect_to registered_applications_path

        else

            flash.now[:alert] = 'There was an error saving the app. Please try again.'
            render :new
        end
    end

    def destroy
        @reg_app = RegisteredApplication.find(params[:id])
        if @reg_app.destroy
            flash[:notice] = "\"#{@reg_app.name}\" was deleted successfully."
            redirect_to registered_applications_path
        else
            flash.now[:alert] = 'There was an error deleting the app.'
            render :show
        end
    end

    def show
        @reg_app = RegisteredApplication.find(params[:id])
        @events = @reg_app.events.all
    end

    def index
        @reg_apps = RegisteredApplication.where("user_id = #{current_user.id}")
    end
end

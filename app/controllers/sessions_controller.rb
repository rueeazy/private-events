class SessionsController < ApplicationController

    def new
    end

    def create
        
        @user = User.find_by(name: params[:name])
       
        if @user
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:alert] = "Invalid Name"
            redirect_to login_path
        end
        
    end

    def destroy
        session.delete(:user_id)
        @user = nil
        redirect_to '/login'
    end

    def login
    end

    def welcome
    end

end

class SessionsController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(password: params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end

    def logout
        reset_session
        redirect_to root_path
    end
end

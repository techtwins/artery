class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end



    private

    def find_user
        @user = User.all.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :zip_code)
    end
end

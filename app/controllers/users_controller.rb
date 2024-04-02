class UsersController < ApplicationController
    def index
      @users = User.all
      render :index
    end
    def users_params
      params.permit(:name,:email,:password,:password_confirmation)
    end
    def create
        user = User.new(users_params)
        if user.save
          render json: { message: "User created successfully" }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :bad_request
        end
      end
      def destroy
        @user = User.find_by(id: params[:id])
      end
end

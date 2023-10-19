class UsersController < ApplicationController
    def index
        @users = User.page(params[:page]).per(5).order("created_at DESC")
    end
    def new   
        @user = User.new
    end
     def create 
        @user = User.new(user_params)
        # render plain: @book.inspect
        if @user.save 
        #   HelloJob.perform_later(@user)
          flash[:notice] = "User was created successfully"
          redirect_to users_path
        else
          render 'new'
        end
      end

      private       
      
      def user_params
        # Dapatkan semua parameter yang diperlukan
        permitted_params = params.require(:user).permit(:email, :username, :password)      
        # Tambahkan nilai default untuk :role jika tidak ada atau kosong
        permitted_params[:role] ||= 'admin'
      
        return permitted_params
      end
      
end
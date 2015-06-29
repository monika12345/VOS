class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user,  only: :destroy



   def show

    #1.@user = User.find_by_sql("SELECT * FROM users WHERE users.id = #{params[:id]}").first
     @user = User.find(params[:id])
    @parking_places = @user.parking_places.paginate(page: params[:page])
     @rental = Rental.new

   end


 def index


    @users = User.paginate(page: params[:page])
 end


 
   def destroy
      #2. User.find_by_sql("DELETE FROM users WHERE  users.id = #{params[:id]}")
           User.find(params[:id]).destroy
           
       flash[:success] = "User deleted"
       redirect_to users_url
  end
                 
 def user_params
       params.require(:user).permit(:name, :email, :password,
                                          :password_confirmation)
 end                
                 

  def new
     @user = User.new
  end
  

  def create
     
   @user = User.new(user_params)
      if @user.save
        log_in @user

        redirect_to parking_places_path
      else
       render 'new'
       end
      end

   def edit
   
    # @user = User.find(params[:id])
   end 
   
   def update

   #3.  query = "UPDATE users SET name = '#{params[:user][:name]}', email = '#{params[:user][:email]}', updated_at = now() WHERE id = #{@user.id}"
    #3. connection = ActiveRecord::Base.connection
    #3. connection.execute(query)
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
        flash[:success] = "Profile update"
       redirect_to user_url
     else

        render 'edit'
    end
   end
   
   
   
   
    private
    
       
  def admin_user
     redirect_to(root_url) unless current_user.admin?
  end
      
  
    
  def logged_in_user
      unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  
  #Confirm the correct user
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
   end
end



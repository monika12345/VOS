class SessionsController < ApplicationController
  def new
  end
    
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remembe_me] == '1' ? remember(user) : forget(user) 
        redirect_back_or parking_places_path
       # Log the user in and redirect to the user's show page.
       else
            # Create an error message.
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
       end
  end
                                          
   def destroy
     log_out if logged_in?
     redirect_to login_url
   end
  end
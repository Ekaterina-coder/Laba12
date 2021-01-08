class SessionController < ApplicationController
  def new
  end

  def create
   user = User.find_by_name(params[:username])
   password = params[:password]
   if user && user.authenticate(password)
     session[:user_id] = user.id
     redirect_to '/'
   else
     redirect_to '/login'
   end
 end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

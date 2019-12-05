class SessionsController < ApplicationController
  before_action :current_user

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #redirect_back_or user
        format.html { redirect_back_or user, notice: "#{user.type} #{user.name} was successfully log in." }
      else
        format.html { redirect_to login_url, alert: 'Invalid email/password combination' }
      end
    end
  end

  def destroy
    log_out
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end

  end


end

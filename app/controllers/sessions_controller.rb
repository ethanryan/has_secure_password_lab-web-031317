class SessionsController < ApplicationController

  def new
    # nothing to do here!
  end

  def create #got this from classmate
    if params[:user][:password].present? && params[:user][:name].present?
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  # def create
  #   @user = User.find_by(name: params[:name])
  #   authenticate = @user.try(:authenticate, params[:password]) #adding this
  #   return head(:forbidden) unless @user.authenticate(params[:password])
  #   session[:user_id] = @user.id
  # end

  def destroy
    session.delete :name
    redirect_to '/sessions/new' #logout will actually be a submit button that we style to look like a link
  end

end

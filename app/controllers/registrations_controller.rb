class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, :notice => 'Signed up!'
    else
      render :new
    end
  end
end 
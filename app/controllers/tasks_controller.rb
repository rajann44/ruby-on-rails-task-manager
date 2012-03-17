class TasksController < ApplicationController
  before_filter :require_login
  before_filter :set_task, :only => [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order('due_date ASC')
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      redirect_to @task, :notice => 'Task created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice => 'Task updated!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, :notice => 'Task deleted!'
  end

  private
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def require_login
    unless current_user
      redirect_to login_path, :alert => 'You must be logged in.'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end 
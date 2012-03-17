class CategoriesController < ApplicationController
  before_filter :require_login
  before_filter :set_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category, :notice => 'Category created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to @category, :notice => 'Category updated!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, :notice => 'Category deleted!'
  end

  private
  def set_category
    @category = Category.find(params[:id])
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
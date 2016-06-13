class TodosController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @todos = Todo.where(owner_email: session[:current_email])
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.where(owner_email: session[:current_email]).create(params.require(:todo).permit(:title))
    redirect_to root_path
  end

  def ensure_user_logged_in
    if session[:current_email].blank?
      redirect_to new_session_path
    end
  end
end

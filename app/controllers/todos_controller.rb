class TodosController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    # @todos = Todo.where(owner_email: current_email)
    @incomplete_todos = current_user.todos.where(completed_at: nil)
    @completed_todos = current_user.todos.where.not(completed_at: nil)
  end

  def new
    @todo = Todo.new
  end

  def create
    # Todo.where(owner_email: current_email).create(params.require(:todo).permit(:title))
    current_user.todos.create(params.require(:todo).permit(:title))
    redirect_to root_path
  end
end

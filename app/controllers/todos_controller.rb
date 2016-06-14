class TodosController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @incomplete_todos = todo_scope.where(completed_at: nil).order(created_at: :asc)
    @completed_todos = todo_scope.where.not(completed_at: nil).order(completed_at: :desc)
  end

  def new
    @todo = Todo.new
  end

  def create
    todo_scope.create(params.require(:todo).permit(:title))
    redirect_to root_path
  end

  private

  def todo_scope
    current_user.todos
  end
end

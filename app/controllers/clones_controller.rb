class ClonesController < ApplicationController
  def create
    new_todo = Todo.find(params[:todo_id]).dup
    new_todo.save
    redirect_to root_path
  end
end

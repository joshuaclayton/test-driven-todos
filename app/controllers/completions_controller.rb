class CompletionsController < ApplicationController
  def create
    # find the todo
    todo = Todo.find(params[:todo_id])

    # update the completed_at timestamp
    todo.touch :completed_at

    redirect_to root_path
  end

  def destroy
    todo = Todo.find(params[:todo_id])
    todo.update_attribute :completed_at, nil
    redirect_to root_path
  end
end

require "rails_helper"

describe TodosController, "#create" do
  it "allows creation" do
    todo_params = {
      todo: {
        title: "Buy eggs"
      }
    }

    post :create, todo_params

    expect(Todo.where(title: "Buy eggs").count).to eq 1
  end
end

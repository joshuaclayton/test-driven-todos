require "rails_helper"

feature "User views todos" do
  scenario "successfully" do
    Todo.create!(title: "Buy eggs")

    visit root_path

    expect(page).to have_todo "Buy eggs"
  end
end

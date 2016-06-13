require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    sign_in_as "person@example.com"

    create_todo_titled "Buy eggs"

    expect(page).to have_todo "Buy eggs"
  end

  def create_todo_titled(title)
    click_on "Create a new todo"
    fill_in "Title", with: title
    click_on "Create Todo"
  end
end

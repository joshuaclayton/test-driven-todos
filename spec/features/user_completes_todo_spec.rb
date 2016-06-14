require "rails_helper"

feature "User completes todo" do
  scenario "successfully" do
    # sign in
    sign_in_as "person@example.com"

    # create a todo
    create_todo_titled "Buy eggs"

    # mark the todo as complete
    mark_complete "Buy eggs"

    # ensure todo shows up in the "complete" list
    within "ul.completed" do
      expect(page).to have_todo "Buy eggs"
    end

    within "ul.incomplete" do
      expect(page).not_to have_todo "Buy eggs"
    end
  end

  def mark_complete(title)
    within "li:contains('#{title}')" do
      click_on "Mark complete"
    end
  end
end

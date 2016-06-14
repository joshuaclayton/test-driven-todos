require "rails_helper"

feature "User marks complete todo incomplete" do
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

    mark_incomplete "Buy eggs"

    within "ul.incomplete" do
      expect(page).to have_todo "Buy eggs"
    end

    within "ul.completed" do
      expect(page).not_to have_todo "Buy eggs"
    end
  end

  def mark_complete(title)
    within "li:contains('#{title}')" do
      click_on "Mark complete"
    end
  end

  def mark_incomplete(title)
    within "li:contains('#{title}')" do
      click_on "Mark incomplete"
    end
  end
end

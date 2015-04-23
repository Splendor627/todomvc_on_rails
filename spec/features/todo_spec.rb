require 'rails_helper'

feature "Todos" do
  scenario "that are incomplete are marked as such" do
    create(:todo, title: "buy milk & eggs", completed: false)

    visit "/"
    expect(page).to have_selector("li label", text: "buy milk & eggs")
    expect(page).to_not have_selector("li.completed label", text: "buy milk & eggs")
  end

  scenario "that are completed are marked as such" do
    create(:todo, title: "buy milk & eggs", completed: true)

    visit "/"
    # since there's no good way to assert specific styles (such as
    # text-decoration: line-through) we have to go this route and trust the css
    # works
    expect(page).to have_selector("li.completed label", text: "buy milk & eggs")
  end

  scenario "should contain edit instructions" do
    visit "/"
    expect(page).to have_content("Double-click to edit a todo")
  end
end

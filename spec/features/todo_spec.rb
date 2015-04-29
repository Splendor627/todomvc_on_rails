require 'rails_helper'

feature "The homepage" do
  background do
    create(:todo, title: "buy milk & eggs")
    create(:todo, title: "broccoli")
  end

  scenario "should show my Todos" do
    visit "/"
    expect(page).to have_selector("li label", text: "buy milk & eggs")
    expect(page).to have_selector("li label", text: "broccoli")
  end

  scenario "should show items remaining" do
    visit "/"
    page.has_css?("todo-count", text: " item left")
  end

  scenario "should contain edit instructions" do
    visit "/"
    expect(page).to have_content("Double-click to edit a todo")
  end
end

require "rails_helper"

RSpec.describe "user" do
  it "can create a task list" do
    visit '/'
    click_button "Create New List"
    fill_in "Title", with: "First"
    fill_in "Description", with: "Stuff"

    click_button "Create List"

    click_link "First"
    click_link_or_button "Create New Task"
    fill_in "Title", with: "Secibd"
    fill_in "Description", with: "??"
    fill_in "task[start_date]", with: "2015-08-27"
    fill_in "task[due_date]", with: "2015-08-27"
    click_link_or_button "Create Task"

    expect(page).to have_content("Secibd")
  end
end
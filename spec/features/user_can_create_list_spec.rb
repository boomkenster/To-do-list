require "rails_helper"

RSpec.describe "user" do
  it "can create a task list" do
    visit '/'
    click_button "Create New List"
    fill_in "Title", with: "First"
    fill_in "Description", with: "Stuff"

    click_button "Create List"

    expect(page).to have_content("First")
    expect(page).to have_content("Stuff")
  end
end
require "rails_helper"

RSpec.describe "user" do
  it "can create a delete list" do
    visit '/'
    click_button "Create New List"
    fill_in "Title", with: "First"
    fill_in "Description", with: "Stuff"

    click_button "Create List"

    click_link "Remove"

    expect(page).to_not have_content("Newie")
    expect(page).to_not have_content("Up in here")
  end
end
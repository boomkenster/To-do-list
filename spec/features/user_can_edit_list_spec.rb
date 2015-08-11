require "rails_helper"

RSpec.describe "user" do
  it "can create a edit list" do
    visit '/'
    click_button "Create New List"
    fill_in "Title", with: "First"
    fill_in "Description", with: "Stuff"

    click_button "Create List"

    click_link "Edit"
    fill_in "Title", with: "Newie"
    fill_in "Description", with: "Up in here"
    click_link_or_button "Update List"

    expect(page).to have_content("Newie")
    expect(page).to have_content("Up in here")
  end
end
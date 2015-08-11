require "rails_helper"

RSpec.describe "user" do
  it "can visit show page a task list" do
    visit '/'
    click_button "Create New List"
    fill_in "Title", with: "First"
    fill_in "Description", with: "Stuff"

    click_button "Create List"
    click_link "First"
    list = List.first
    expect(page).to have_content("First")
    expect(page).to have_content("Stuff")
    expect(current_path).to eq(list_path(list.id))
  end
end
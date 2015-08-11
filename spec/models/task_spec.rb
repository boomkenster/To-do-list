require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:list) { List.create!(title: "BOO", description: "YA")}
  let(:task) { Task.create!(title: "boo",
                            description: "ya",
                            list_id: list.id,
                            start_date: Date.today,
                            due_date: Date.tomorrow)}
  it {should validate_presence_of(:title)}
  it {should belong_to(:list)}

  it "can mark task as completed" do 
    expect(task.status).to eq("Incomplete")
    task.mark_complete

    expect(task).to be_valid
    expect(task.status).to eq("Complete")
  end

  it "cannot create a task in the past" do
    task.start_date = Date.yesterday

    expect(task).not_to be_valid
  end
end

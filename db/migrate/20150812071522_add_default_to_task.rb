class AddDefaultToTask < ActiveRecord::Migration
def up
  change_column :tasks, :status, :string, :default => "Incomplete" 
end

def down
  change_column :tasks, :status, :string, :default => nil
end
end

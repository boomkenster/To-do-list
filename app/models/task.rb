class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence:true 

  before_save :default_values

  def default_values
    self.status ||= "Incomplete"
  end

  def complete
    self.status = "Complete"
  end
end

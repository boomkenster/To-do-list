class List < ActiveRecord::Base
  validates :title, presence:true 
  has_many :tasks, dependent: :destroy
end

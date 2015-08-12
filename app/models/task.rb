class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence:true
  validate :start_date_cannot_be_in_the_past
  validate :due_date_cannot_be_in_the_past           
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.gianteagle.com/PageFiles/11386/thumbnail_Petcare_SmallAnimals_05012012.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def default_values
    self.status ||= "Incomplete"
  end

  def mark_complete
    self.status = "Complete"
  end

  def complete?
    self.status = "Complete"
  end

  def self.future
    where("start_date > ?", Date.today)
  end
 
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "cannot be in the past")
    end
  end
 
  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "cannot be in the past")
    end
  end

  def the_past?
    true if self.start_date.present? && self.start_date <= Date.today
  end

end

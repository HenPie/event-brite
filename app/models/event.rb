class Event < ApplicationRecord
  belongs_to :admin, :class_name => "User"
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true 
  validate :is_start_date_past?

  validates :duration, presence: true
  validate :is_duration_correct?

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000}
  validates :price, presence: true, numericality: {greater_than: 1, less_than: 1000}
  validates :location, presence: true

  def is_start_date_past?
    if start_date < Time.now
      errors.add(:start_date, "Vous ne pouvez pas prendre une date passée")
    end
  end

  def is_duration_correct?
    if (duration % 5) != 0 || duration <= 0
      errors.add(:duration, "La durée doit être un multiple de 5 et strictement positif")
    end
  end

  def end_date
    self.start_date + self.duration * 60
  end

  def is_user_attending?(user)
    if self.attendances.where(user_id: user.id) != nil
      puts "The user is attending"
      return true
    else 
      puts "The user is not attending"
      return false
    end
  end

end

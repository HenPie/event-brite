class Attendance < ApplicationRecord
  after_create :attendance_send

  belongs_to :event
  belongs_to :user

  def attendance_send
    AttendanceMailer.participation_email(self).deliver_now
  end
end
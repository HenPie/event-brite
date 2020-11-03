class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@event-brite-again.fr'

  def participation_email(attendance)
    @participant = attendance.user  
    @url = 'event-brite-again.herokuapp.com'
    @event = attendance.event
    mail(to: @participant.email, subject: 'Votre participation est bien prise en compte !')
  end

end

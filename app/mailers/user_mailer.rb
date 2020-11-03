class UserMailer < ApplicationMailer
  default from: 'no-reply@event-brite-again.fr'

  def welcome_email(user)
    #on récupère l'instance user pour la view
    @user = user 
    #on définit une variable @url
    @url = 'event-brite-again.herokuapp.com'
    #c'est cet appel à mail()
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

end

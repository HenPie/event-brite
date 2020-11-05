class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  after_commit :add_default_avatar, on: %i[create]

  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, :foreign_key => 'admin_id', class_name: "Event"
  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'loris.jpg'
          )
        ),
        filename: 'loris.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
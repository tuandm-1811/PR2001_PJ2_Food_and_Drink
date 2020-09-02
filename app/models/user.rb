class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable,:omniauthable, omniauth_providers: [ :google_oauth2]
    def self.from_omniauth(auth)
      result = User.where(email: auth.info.email).first
      if result
        return result
      else
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.fullname = auth.info.username
          user.image = auth.info.image
          user.uid = auth.uid
          user.provider = auth.provider

          #  If you are using confirmable and the provider(s) you use validate emails
          user.skip_confirmation!
        end
      end
    end
  end 


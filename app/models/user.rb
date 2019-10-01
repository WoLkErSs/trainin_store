class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).or(where(email: auth.info.email)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end

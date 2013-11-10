class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: true
  validates_presence_of :first_name

  before_save { self.email = email.downcase }

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.url = auth.info.urls.Facebook
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires = Time.at(auth.credentials.expires_at)
      user.facebook = true
      user.save!
    end
  end
end
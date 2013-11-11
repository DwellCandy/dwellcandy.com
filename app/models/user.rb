class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

  def from_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.email = auth.info.email
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.image = auth.info.image
    self.url = auth.info.urls.Facebook
    self.location = auth.info.location
    self.oauth_token = auth.credentials.token
    self.oauth_expires = Time.at(auth.credentials.expires_at)
    self.facebook = true
    self.password = 123456
    self.password_confirmation = 123456
  end
end
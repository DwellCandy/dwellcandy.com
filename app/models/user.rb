class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :first_name, :last_name, :email
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }

  has_many :jobs

  def from_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.email = auth.info.email
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.image = get_photo(auth.uid)
    self.url = auth.info.urls.Facebook
    self.location = auth.info.location
    self.oauth_token = auth.credentials.token
    self.oauth_expires = Time.at(auth.credentials.expires_at)
    self.facebook = true
    self.password = 123456
    self.password_confirmation = 123456
  end

  def get_photo(uid)
    url = URI.parse("http://graph.facebook.com/#{uid}/?fields=picture")
    picture_data = MultiJson.load(Net::HTTP.get(url))
    picture_data['picture']['data']['url']
  end
end
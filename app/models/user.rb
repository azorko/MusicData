# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password #need this to be able to validate the password
  
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  # after_initialize :ensure_session_token
  # is there a before_validation method?
  before_validation(on: :create) do
    ensure_session_token
  end
  
  has_many :notes
  
  def generate_session_token
    SecureRandom::urlsafe_base64
  end
  
  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end
  
  def password=(password)
    return unless password.present?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    #converts t into Password object and then checks with password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  #returns the user, or nil if the user is not found
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user && user.is_password?(password) ? user : nil
  end
end

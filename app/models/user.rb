class User < ActiveRecord::Base
has_secure_password
has_many :review
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email,password)
    em = email.strip.downcase
    user = User.find_by_email(em)

    user && user.authenticate(password) ? user : nil
  end


end

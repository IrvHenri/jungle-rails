class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, :length => {:minimum => 8 }, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false, presence: true

  def self.authenticate_with_credentials(email,password)
     user = User.find_by_email(email.downcase.strip)
     user && user.authenticate(password) ? user : nil
  end

end

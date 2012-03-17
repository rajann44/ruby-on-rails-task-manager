class User < ActiveRecord::Base
  has_many :tasks

  # Basic authentication methods (not secure, for learning/demo only)
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  before_save :encrypt_password

  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true, :if => :password_required?

  def authenticate(password)
    self.encrypted_password == encrypt(password)
  end

  private
  def encrypt_password
    if password.present?
      self.password_salt = SecureRandom.hex(8)
      self.encrypted_password = encrypt(password)
    end
  end

  def encrypt(pass)
    Digest::SHA1.hexdigest("--#{password_salt}--#{pass}--")
  end

  def password_required?
    encrypted_password.blank? || password.present?
  end
end 
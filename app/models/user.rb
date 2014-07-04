class User
  include MongoMapper::Document
  include ActiveModel::SecurePassword

  before_save { self.email = email.downcase }
  before_validation { self.email = email.downcase }

  key :name, 			String
  key :email, 			String, :required => true, :unique => true, :index => true
  key :password_digest,	String
  timestamps!

  validates :name, 	presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end

class User < ActiveRecord::Base


	has_secure_password

	
	before_save { |user| user.email = user.email.downcase }
	before_validation { |user| user.name = "hamada" if user.name.blank?}


	validates :name, presence: true, length: { maximum: 40}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	              uniqueness: { case_sensitive: false}
	              validates :password, presence: true, length: { minimum: 8}
	              validates :password_confirmation, presence: true, length: { minimum: 8}


def self.name_longer_than_eight()
	User.where(length(name) > 8 )

end



end

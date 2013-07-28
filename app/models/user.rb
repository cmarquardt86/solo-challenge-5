require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	validates :name, presence: true
	validates :password_hash, length: {minimum: 6}, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
	validates :access_level, presence: true
	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end

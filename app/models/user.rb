class User < ActiveRecord::Base
	has_many :followed_follows, class_name: 'Follow', foreign_key: :followed_id
	has_many :followings, through: :followed_follows

	has_many :following_follows, class_name: 'Follow', foreign_key: :following_id
	has_many :followings, through: :following_follows

	has_many :posts

	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+{2,}\z/}
	validates :email, uniqueness: true, presence: true
	validates :handle, uniqueness: true, presence: true
	validates :password, length: { minimum: 5 }, presence: true

	before_create do
	  self.password = SCrypt::Password.create(password)
	end

	def self.authenticate(handle, password)
	  user = User.find_by(handle: handle)
	  return user if user && SCrypt::Password.new(user.password) == password
	  nil
	end
end

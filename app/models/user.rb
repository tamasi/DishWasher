class User < ActiveRecord::Base

	#set Relation between User and Organization
	belongs_to :organizations

	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  	#validate username and email
  	validates :username, :presence => true, :uniqueness => true
  	validates :email, presence: true, :uniqueness => true
  	

  	mount_uploader :user_avatar, UserAvatarUploader
end

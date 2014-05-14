class User < ActiveRecord::Base

	#set Relation between User and Organization
	belongs_to :organizations

  #Relation with turn_to_wash to establish the day to wash
  has_many :user_turn
  has_many :turn_to_wash, through: :user_turn

  #query to bringing back only a user belongs to a organization
	scope :org, -> (user) {where("organization_id = ?", user.organization_id)} 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #validate username and email
  validates :username, :presence => true, :uniqueness => true
  validates :email, presence: true, :uniqueness => true
  	

  mount_uploader :user_avatar, UserAvatarUploader
end

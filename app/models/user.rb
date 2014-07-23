class User < ActiveRecord::Base

	#set Relation between User and Organization
	belongs_to :organization

  has_many :turns


  #query to bringing back only a user belongs to a organization
	scope :org, -> (user) {where("organization_id = ?", user.organization_id)} 

  #User.from_organization(organization)
  scope :from_organization, -> (organization) { where(organization_id: organization) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #validate username and email
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  accepts_nested_attributes_for :organization



  mount_uploader :user_avatar, UserAvatarUploader
end



class Admin < ActiveRecord::Base

  include DeviseInvitable::Inviter

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_many :invitations, class_name: self.to_s, as: :invited_by
  has_many :invitations, class_name: 'Facilitator', as: :invited_by

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

end

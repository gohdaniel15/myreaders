class Facilitator < ActiveRecord::Base

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_many :projects, inverse_of: :facilitator

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

end

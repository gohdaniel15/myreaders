class Project < ActiveRecord::Base

  belongs_to :facilitator, inverse_of: :projects
  has_many :students, inverse_of: :project, dependent: :destroy
  has_many :sessions, inverse_of: :project, dependent: :destroy

  accepts_nested_attributes_for :students, allow_destroy: true

  validates :name, presence: true
  validates :location, presence: true
  validates :start_on, presence: true
  validates :status, presence: true
  validates_associated :students

  enum status: [:inactive, :active]

end

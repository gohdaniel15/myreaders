class Project < ActiveRecord::Base

  belongs_to :facilitator, inverse_of: :projects

  validates :name, presence: true
  validates :location, presence: true
  validates :start_on, presence: true
  validates :status, presence: true

  enum status: [:inactive, :active]

end

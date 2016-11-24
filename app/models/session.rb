class Session < ActiveRecord::Base

  belongs_to :project, inverse_of: :sessions
  has_many :attendances, inverse_of: :session

  accepts_nested_attributes_for :attendances, allow_destroy: true

  validates :date, presence: true, uniqueness: true

end

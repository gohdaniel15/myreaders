class Diagnostic < ActiveRecord::Base

  belongs_to :project, inverse_of: :diagnostics
  belongs_to :student, inverse_of: :diagnostics

  validates :type, presence: true
  validates :student, presence: true
  validates :project, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }

end

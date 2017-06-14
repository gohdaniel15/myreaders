class Student < ActiveRecord::Base

  belongs_to :project, inverse_of: :students
  has_many :attendances, inverse_of: :student
  has_many :diagnostics, inverse_of: :student

  validates :project, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :class_name, presence: true

end

class Student < ActiveRecord::Base

  belongs_to :project, inverse_of: :students

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :class_name, presence: true

end

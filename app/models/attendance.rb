class Attendance < ActiveRecord::Base

  belongs_to :session, inverse_of: :attendances
  belongs_to :student, inverse_of: :attendances

end

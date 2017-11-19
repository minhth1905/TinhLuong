class Attendance < ApplicationRecord
  belongs_to :worker
  belongs_to :year
  belongs_to :month
  belongs_to :day
end

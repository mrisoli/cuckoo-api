class Appointment < ApplicationRecord
  enum status: [:planned, :completed]
end

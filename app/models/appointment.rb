class Appointment < ApplicationRecord
  enum status: [:planned, :completed]

  belongs_to :schedule, optional: true

  scope :futures, ->{ planned.where("start > ?", DateTime.current)}
end

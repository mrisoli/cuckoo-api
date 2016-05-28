class Appointment < ApplicationRecord
  enum status: [:planned, :completed]

  belongs_to :schedule, optional: true

  scope :futures, ->{ planned.where("start > ?", DateTime.current) }

  scope :schedule_updatable, ->{ where(manually_updated: false) }
end

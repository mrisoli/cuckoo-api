module Schedules
  class Destroyer
    attr_reader :schedule

    def initialize(schedule)
      @schedule = schedule
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      schedule.appointments.futures.delete_all
      schedule.appointments.update_all(schedule_id: nil)
      schedule.destroy
    end
  end
end

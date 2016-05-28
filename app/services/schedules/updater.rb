module Schedules
  class Updater

    attr_reader :schedule, :params

    def initialize(schedule, params)
      @schedule = schedule
      @params = params
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      Schedule.transaction do
        schedule.update(params)
        schedule.appointments.schedule_updatable.each do |appointment| 
          appointment.update(title: schedule.title)
        end
      end
    end
  end
end

class ScheduleCreator

  attr_reader :schedule

  def initialize(params)
    @schedule = Schedule.new(params)
  end

  def self.call(*args)
    new(*args).call
  end


  def call
    Schedule.transaction do
      @schedule.save
      (@schedule.start..@schedule.end).each{|date| create_appointment(date)}
    end
    @schedule
  end

  private

  def create_appointment(date)
    start = date.to_datetime + @schedule.time.seconds
    @schedule.appointments.create(title: @schedule.title, start: start)
  end
end

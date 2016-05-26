require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  include ActiveSupport::Testing::TimeHelpers
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { end: @schedule.end, pattern: @schedule.pattern, start: @schedule.start, time: '14:00', title: @schedule.title } }
    end

    assert_response 201
  end

  test "should create appointments" do
    assert_difference('Appointment.count', 7) do
      post schedules_url, params: { schedule: { end: @schedule.end, pattern: 1, start: @schedule.start, time: '14:00', title: @schedule.title } }
    end

    assert_response 201
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { end: @schedule.end, pattern: @schedule.pattern, start: @schedule.start, time: '14:00', title: @schedule.title } }
    assert_response 200
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_response 204
  end

  test "should destroy future planned appointments" do
    travel_to Time.new(2016, 5, 24, 0, 0, 0) do
      schedule = ScheduleCreator.call({ end: @schedule.end, pattern: @schedule.pattern, start: @schedule.start, time: '14:00', title: @schedule.title })
      assert_difference('Appointment.count', -5) do
        delete schedule_url(schedule)
      end
    end

    assert_response 204
  end
end

require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { end: @schedule.end, pattern: @schedule.pattern, start: @schedule.start, time: @schedule.time, title: @schedule.title } }
    end

    assert_response 201
  end

  test "should create appointments" do
    assert_difference('Appointment.count', 7) do
      post schedules_url, params: { schedule: { end: @schedule.end, pattern: 1, start: @schedule.start, time: @schedule.time, title: @schedule.title } }
    end

    assert_response 201
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { end: @schedule.end, pattern: @schedule.pattern, start: @schedule.start, time: @schedule.time, title: @schedule.title } }
    assert_response 200
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_response 204
  end
end

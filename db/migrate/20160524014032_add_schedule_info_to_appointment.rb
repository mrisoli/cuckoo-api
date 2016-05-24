class AddScheduleInfoToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :schedule, foreign_key: true
    add_column :appointments, :manually_updated, :boolean, default: false
  end
end

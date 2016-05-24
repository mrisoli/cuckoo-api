class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :pattern
      t.integer :time
      t.string :title
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end

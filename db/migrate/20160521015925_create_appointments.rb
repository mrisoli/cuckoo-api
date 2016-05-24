class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title
      t.datetime :start
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

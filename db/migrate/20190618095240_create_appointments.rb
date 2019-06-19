class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :time
      t.string :patient_id
      t.string :doctor_id

  end
end
end

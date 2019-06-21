class CreateSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :specialities do |t|
      t.string :name
      t.integer :doctor_id
  end
end
end

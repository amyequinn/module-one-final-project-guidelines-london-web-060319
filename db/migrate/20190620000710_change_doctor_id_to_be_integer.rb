class ChangeDoctorIdToBeInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments,
    :doctor_id, :integer
  end
end

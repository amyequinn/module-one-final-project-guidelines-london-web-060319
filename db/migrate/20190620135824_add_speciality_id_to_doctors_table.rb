class AddSpecialityIdToDoctorsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors,
      :speciality_id, :integer
  end
end

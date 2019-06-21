class RemoveDrIdFromTable < ActiveRecord::Migration[5.2]
    def change
      remove_column :specialities,
      :doctor_id, :integer
    end
  end

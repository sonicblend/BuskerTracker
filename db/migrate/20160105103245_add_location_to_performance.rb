class AddLocationToPerformance < ActiveRecord::Migration
  def change
    add_column :performances, :location_id, :integer
  end
end

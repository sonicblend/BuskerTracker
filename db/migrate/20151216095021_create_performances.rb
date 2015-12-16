class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :amplified
      t.integer :busker_id

      t.timestamps null: false
    end
  end
end

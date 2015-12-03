class CreateBuskers < ActiveRecord::Migration
  def change
    create_table :buskers do |t|
      t.string :name
      t.text :description
      t.string :image_id
      t.string :facebook
      t.string :twitter
      t.string :www

      t.timestamps null: false
    end
  end
end

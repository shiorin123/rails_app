class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.string :name
      t.text :about
      t.string :image
      t.text :comments
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.string :name
      t.text :about
      t.string :image
      t.text :comments

      t.timestamps
    end
  end
end

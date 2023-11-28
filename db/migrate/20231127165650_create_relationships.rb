class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |g|
      g.references :user, foreign_key: true
      g.references :follow, foreign_key: { to_table: :users }

      g.timestamps

      g.index [:user_id, :follow_id], unique: true
    end
  end
end

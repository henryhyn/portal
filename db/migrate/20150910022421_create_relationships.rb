class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true
      t.references :followed, index: true
      t.integer :status, :default => 0, :null => false

      t.timestamps
    end

    add_index :relationships, [:follower_id, :followed_id, :status], :unique => true
  end
end

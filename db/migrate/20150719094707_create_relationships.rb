class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true  # foreign_key: true
      t.references :followed, index: true  # foreign_key: true

      t.timestamps   #null: false 削除
      
      
      t.index [:follower_id, :followed_id], unique: true # この行を追加
    end
  end
end

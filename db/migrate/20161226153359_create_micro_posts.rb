class CreateMicroPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :micro_posts do |t|
    t.belongs_to :users, index: true
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end

class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|

      t.integer :user_id, null: false
      t.integer :age_id, null: false
      t.integer :category_id, null: false
      t.string  :title, null: false
      t.text    :body, null: false
      t.timestamps
    end
  end
end

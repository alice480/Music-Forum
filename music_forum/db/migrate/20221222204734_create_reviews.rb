class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      
      t.string :topic, null: false
      t.string :text,  null: false
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end

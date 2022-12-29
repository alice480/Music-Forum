class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :topic
      t.string :text
      t.string :path

      t.timestamps
    end
  end
end

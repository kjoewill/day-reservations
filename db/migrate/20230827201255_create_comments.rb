class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.date :day, null: false
      t.text :content
      t.timestamps
    end
    add_index :comments, :day, unique: true
  end
end

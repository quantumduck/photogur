class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :contents
      t.integer :picture

      t.timestamps
    end
  end
end

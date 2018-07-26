class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :description
      t.text :detail
      t.string :picture

      t.timestamps
    end
  end
end

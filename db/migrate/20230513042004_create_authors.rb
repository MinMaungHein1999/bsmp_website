class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end

class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :categories do |t|
      t.rename :category_name, :name
    end
  end
end

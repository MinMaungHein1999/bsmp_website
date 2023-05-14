class CreateBkjobs < ActiveRecord::Migration[7.0]
  def change
    create_table :bkjobs do |t|

      t.timestamps
    end
  end
end

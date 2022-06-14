class CreateLoves < ActiveRecord::Migration[6.0]
  def change
    create_table :loves do |t|

      t.integer :user_id
      t.integer :worry_id

      t.timestamps
    end
  end
end

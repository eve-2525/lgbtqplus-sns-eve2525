class CreateWorries < ActiveRecord::Migration[6.0]
  def change
    create_table :worries do |t|
      t.string :title
      t.text :problem
      t.text :status
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end

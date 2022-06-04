class CreateWorries < ActiveRecord::Migration[6.0]
  def change
    create_table :worries do |t|
      t.string :title,               null: false
      t.text :problem,               null: false
      t.integer :status,               null: false, default: 0
      t.integer :situation,               null: false, default: 0
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end

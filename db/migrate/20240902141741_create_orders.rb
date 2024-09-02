class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :equipament, null: false, foreign_key: true
      t.date :period_start, null: false
      t.date :period_end
      t.string :status, limit: 20, default: :pending

      t.timestamps
    end
    add_index :orders, :status
  end
end

class CreateAdvances < ActiveRecord::Migration[6.0]
  def change
    create_table :advances do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.string :debtor
      t.datetime :date
      t.integer :invoice_number
      t.float :advance_per
      t.string :status
      t.float :final_amount

      t.timestamps
    end
  end
end

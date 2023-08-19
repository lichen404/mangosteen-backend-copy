class CreateValidationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :validation_codes do |t|
      t.string :email
      t.integer :kind, default: 1,null: false
      t.string :used_at
      t.string :code, limit: 20
      t.timestamps
    end
  end
end

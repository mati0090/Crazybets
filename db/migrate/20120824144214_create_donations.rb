class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :bet_id
      t.integer :amount

      t.timestamps
    end
  end
end

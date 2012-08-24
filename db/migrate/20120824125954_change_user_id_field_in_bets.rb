class ChangeUserIdFieldInBets < ActiveRecord::Migration
  def up
    remove_column :bets, :user_id
    add_column    :bets, :author_id, :integer
  end

  def down
    remove_column :bets, :author_id
    add_column    :bets, :user_id, :integer
  end
end

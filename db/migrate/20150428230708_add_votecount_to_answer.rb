class AddVotecountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :votecount, :integer, default: 0
  end
end

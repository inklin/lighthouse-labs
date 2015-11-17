class AddCountersToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :votes_count, :integer, default: 0
    add_column :songs, :reviews_count, :integer, default: 0
  end
end

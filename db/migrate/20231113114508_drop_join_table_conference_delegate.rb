class DropJoinTableConferenceDelegate < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :conferences, :delegates
  end
end

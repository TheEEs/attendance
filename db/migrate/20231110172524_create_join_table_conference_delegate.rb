class CreateJoinTableConferenceDelegate < ActiveRecord::Migration[7.0]
  def change
    create_join_table :conferences, :delegates do |t|
      # t.index [:conference_id, :delegate_id]
      # t.index [:delegate_id, :conference_id]
    end
  end
end

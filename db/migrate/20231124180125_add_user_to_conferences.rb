class AddUserToConferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :conferences, :user, null: false, foreign_key: true, default: 0
  end
end

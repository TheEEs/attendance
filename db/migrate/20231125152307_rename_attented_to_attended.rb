class RenameAttentedToAttended < ActiveRecord::Migration[7.0]
  def change
    rename_column(:attends,:attented, :attended)
  end
end

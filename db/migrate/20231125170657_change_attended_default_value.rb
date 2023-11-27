class ChangeAttendedDefaultValue < ActiveRecord::Migration[7.0]
  def up
    Attend.where(attended: nil).update_all(attended: false)
    change_column_null :attends, :attended, false
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
    change_column_default :attends, :attended, false
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)e
  end

  def down
    change_column_null :attends, :attended, true
    change_column_default :attends, :attended, nil
  end
end

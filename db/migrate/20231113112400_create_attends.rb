class CreateAttends < ActiveRecord::Migration[7.0]
  def change
    create_table :attends do |t|
      t.references :conference, null: false, foreign_key: true
      t.references :delegate, null: false, foreign_key: true
      t.boolean :attented

      t.timestamps
    end
  end
end

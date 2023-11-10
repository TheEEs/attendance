class CreateConferences < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences do |t|
      t.string :name
      t.datetime :start_when
      t.string :locate

      t.timestamps
    end
  end
end

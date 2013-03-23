class CreateStationsLines < ActiveRecord::Migration
  def up
    create_table :stations_lines, :id=>false do |t|
      t.column :station_id, :integer
      t.column :line_id, :integer

    end
  end

  def down
    drop_table :stations_lines
  end
end

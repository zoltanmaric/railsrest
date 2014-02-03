class CreateTimestampedPoints < ActiveRecord::Migration
  def change
    create_table :timestamped_points do |t|
      t.timestamp :time, :null => false
      t.decimal :latitude, precision: 9, scale: 6, :null => false
      t.decimal :longitude, precision: 9, scale: 6, :null => false

      t.timestamps
    end
  end
end

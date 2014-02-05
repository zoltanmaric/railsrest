class AddAltitudeToTimestampedPoints < ActiveRecord::Migration
  def change
    add_column :timestamped_points, :altitude, :decimal, precision: 7, scale: 1
  end
end

class AddTourRefToTimestampedPoints < ActiveRecord::Migration
  def change
    add_reference :timestamped_points, :tour, index: true
    add_foreign_key :timestamped_points, :tours
  end
end

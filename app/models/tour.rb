class Tour < ActiveRecord::Base
	has_many :timestamped_points
 	belongs_to :first_point, :class_name => "TimestampedPoint"
end

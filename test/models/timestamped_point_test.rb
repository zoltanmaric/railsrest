require 'test_helper'

class TimestampedPointTest < ActiveSupport::TestCase
	test "close points" do
		far_point = TimestampedPoint.create!(
			time: 		DateTime.civil_from_format(
							:utc,
							2014,
							2,
							4,
							14,
							0
						),
			latitude: 	40.0,
			longitude: 	-77.0
		)

		close_point = TimestampedPoint.create!(
			time: 		DateTime.civil_from_format(
							:utc,
							2014,
							2,
							4,
							14,
							30
						),
			latitude: 	39.01,
			longitude: 	-75.99
		)

		# we're calling load for prettier sql for later, normally this is not a good idea
		close_points = TimestampedPoint.close_to(39.000000, -76.000000).load

		assert_equal 1,				close_points.size
		assert_equal close_point,	close_points.first
	end
end

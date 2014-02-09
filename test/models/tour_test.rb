require 'test_helper'

class TourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "tour points" do
    tour = Tour.create!
  	point1 = tour.timestamped_points.create!(
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

		point2 = tour.timestamped_points.create!(
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

    tour.save
    id = tour.id

    loaded_tour = Tour.find(id)
    loaded_tour.timestamped_points.load
    points = TimestampedPoint.all

		assert_equal [point1, point2], loaded_tour.timestamped_points
    assert_equal [point1, point2], points
	end
end

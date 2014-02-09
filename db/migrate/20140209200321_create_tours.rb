class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.belongs_to :first_point, index: true

      t.timestamps
    end

    add_foreign_key :tours, :timestamped_points, column: 'first_point_id'
  end
end

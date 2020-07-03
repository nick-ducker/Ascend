class CreatePeriodsWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :periods_workouts do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end

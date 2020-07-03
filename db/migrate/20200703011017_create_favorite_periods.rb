class CreateFavoritePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_periods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end

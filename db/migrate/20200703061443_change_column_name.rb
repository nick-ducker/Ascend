class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :workouts, :type, :category
    rename_column :periods, :type, :category
  end
end

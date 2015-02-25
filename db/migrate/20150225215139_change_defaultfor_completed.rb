class ChangeDefaultforCompleted < ActiveRecord::Migration
  def change
    change_column_default :talks, :completed, false
  end
end

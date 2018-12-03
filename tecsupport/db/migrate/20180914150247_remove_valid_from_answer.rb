class RemoveValidFromAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :valid, :boolean
  end
end

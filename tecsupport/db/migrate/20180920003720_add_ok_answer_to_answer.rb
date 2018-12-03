class AddOkAnswerToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :ok_answer, :boolean
  end
end

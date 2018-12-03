class AddQuestionvalidateidToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :questionvalidateid, :integer
  end
end

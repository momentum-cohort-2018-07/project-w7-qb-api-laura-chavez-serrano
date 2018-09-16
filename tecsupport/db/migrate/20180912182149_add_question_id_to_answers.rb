class AddQuestionIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :question_id, :string
  end
end

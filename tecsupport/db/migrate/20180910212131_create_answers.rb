class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.string :user_id
      t.boolean :valid

      t.timestamps
    end
  end
end

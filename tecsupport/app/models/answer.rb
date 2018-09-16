class Answer < ApplicationRecord
    belongs_to :question
  belongs_to :user

  def validate?
    !!questionvalidateid
  end
end

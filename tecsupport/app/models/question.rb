class Question < ApplicationRecord
  paginates_per 5
  include PgSearch
  pg_search_scope :search_by_title_body, :against => [:title, :body]
  has_one_attached :image  
  has_many :answers, dependent: :destroy
  belongs_to :user
  
  
end

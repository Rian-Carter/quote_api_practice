class Quote < ApplicationRecord
  validates :author, presence: :true
  validates :content, presence: :true
  # scope :search_author, -> (author_parameter) { where("author ilike ?", "#{author_parameter}")}
end

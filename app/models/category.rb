class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  default_scope{order created_at: :desc}
  scope :list_category, ->{select :id, :name}
  validates :name, presence: true,
    length: {minimum: Settings.min_length_category,
             maximum: Settings.max_length_category}
end

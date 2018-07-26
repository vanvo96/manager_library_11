class Category < ApplicationRecord
  default_scope{order created_at: :desc}
  validates :name, presence: true,
    length: {minimum: Settings.min_length_category,
             maximum: Settings.max_length_category}
end

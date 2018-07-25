class Publisher < ApplicationRecord
  default_scope{order created_at: :desc}
  validates :name, presence: true,
    length: {minimum: Settings.min_length_publisher,
             maximum: Settings.max_length_publisher}
  validates :location, presence: true,
    length: {minimum: Settings.min_length_publisher_location,
             maximum: Settings.max_length_publisher_location}
end

class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy
  default_scope{order created_at: :desc}
  scope :list_publisher, ->{select :id, :name}
  validates :name, presence: true,
    length: {minimum: Settings.min_length_publisher,
             maximum: Settings.max_length_publisher}
  validates :location, presence: true,
    length: {minimum: Settings.min_length_publisher_location,
             maximum: Settings.max_length_publisher_location}
end

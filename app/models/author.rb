class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  default_scope{order created_at: :desc}
  scope :list_author, ->{select :id, :name}
  mount_uploader :picture, PictureUploader
  validates :name, presence: true,
    length: {minimum: Settings.min_length_author,
             maximum: Settings.max_length_author}
  validates :description, presence: true,
    length: {minimum: Settings.min_length_author_description,
             maximum: Settings.max_length_author_description}
end

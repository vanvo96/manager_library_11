class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher
  default_scope{order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :name, presence: true,
    length: {minimum: Settings.min_length_book,
             maximum: Settings.max_length_book}
  validates :description, presence: true,
    length: {minimum: Settings.min_length_book_description,
             maximum: Settings.max_length_book_description}
  validates :edition, presence: true,
    length: {minimum: Settings.min_length_book_edition,
             maximum: Settings.max_length_book_edition}
  validates :pages,
    numericality: {only_integer: true,
                   greater_than_or_equal_to: Settings.min_book_pages}
end

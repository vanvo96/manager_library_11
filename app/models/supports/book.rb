class Supports::Book
  def categories
    @category = Category.list_category
  end

  def publishers
    @publishers = Publisher.list_publisher
  end

  def authors
    @authors = Author.list_author
  end
end

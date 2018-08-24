require "rails_helper"

RSpec.describe Admin::BooksController, type: :controller do
  let!(:book) {FactoryBot.create :book}
  let(:category) {FactoryBot.create :category}
  let(:publisher) {FactoryBot.create :publisher}
  let(:author) {FactoryBot.create :author}
  let(:admin) {FactoryBot.create :admin}
  before {log_in admin}

  describe "GET #index" do
    before {get :index}
    it "populates an array of books" do
      expect(assigns :books).to eq [book]
    end

    it "renders the index template" do
      is_expected.to render_template :index
    end
  end

  describe "GET #new" do
    before {get :new}
    it "assigns the book to @book" do
      expect(assigns :book).to be_a_new Book
    end

    it "renders the index template" do
      is_expected.to render_template :new
    end
  end

  describe "POST #create" do
    context "valid attributes" do
      before {post :create, params: {book: FactoryBot.attributes_for(:book,
            category_id: category.id,
            publisher_id: publisher.id, author_id: author.id)}}
      it "creates a new book" do
        expect(assigns :book).to be_a Book
      end

      it "shows success create message" do
        expect(flash[:sun]).to eq(I18n.t "admin.books.create.book_created")
      end

      it "redirect to the book#index" do
        is_expected.to redirect_to(admin_books_path)
      end
    end

    context "invalid attributes" do
      before {post :create, params: {book: FactoryBot.attributes_for(:invalid_book)}}

      it "renders the new template" do
        is_expected.to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "found book" do
      before {get :edit, params: {id: book}}
      it "assigns the book to @book" do
        expect(assigns :book).to eq book
      end

      it "renders the edit template" do
        is_expected.to render_template :edit
      end
    end

    context "not found book" do
      before {get :edit, params: {id: -1}}
      it "shows fail message" do
        expect(flash[:lock]).to eq(I18n.t "admin.books.not_found_book")
      end

      it "redirect to the book#index" do
        is_expected.to redirect_to(admin_books_path)
      end
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      before {patch :update, params: {id: book, book: FactoryBot.attributes_for(:book, name: "Poem")}}
      it "assigns the book to @book" do
        expect(assigns :book).to eq book
      end

      it "changes @book's attributes" do
        book.reload
        expect(book.name).to eq ("Poem")
      end

      it "shows success update message" do
        expect(flash[:sun]).to eq(I18n.t "admin.books.update.book_updated")
      end

      it "redirect to the book#index" do
        is_expected.to redirect_to(admin_books_path)
      end
    end

    context "invalid attributes" do
      before {patch :update, params: {id: book, book: FactoryBot.attributes_for(:book, name: "nil")}}
      it "assigns the book to @book" do
        expect(assigns :book).to eq book
      end

      it "do not changes @book's attributes" do
        book.reload
        expect(book.name).to_not eq ("nill")
      end

      it "renders the new template" do
        is_expected.to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    context "Delete book success" do
      before {delete :destroy, params: {id: book}}
      it "delete a book" do
        expect(Book.all).not_to include book
      end

      it "shows success delete message" do
        expect(flash[:sun]).to eq(I18n.t "admin.books.destroy.book_deleted")
      end

      it "redirect to the book#index" do
        is_expected.to redirect_to(admin_books_path)
      end
    end
  end
end

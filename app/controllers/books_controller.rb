class BooksController < InheritedResources::Base
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  load_and_authorize_resource


  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @submitted_books = Book.submitted
    @approved_books = Book.approved
    @deactivated_books = Book.deactivated
    @book=Book.first
  end

  # POST /books
  # POST /books.json
  def create
    @book=Book.new(book_params)
    @book.status="submitted"
    create!
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if @book.has_reviews? 
      @book.status = 'deactivated'
      @book.save
      redirect_to books_url, notice: 'Book had ratings or reviews and has been deactivated.'
    else
      destroy!
    end
  end

  def approve
    @book.status = "approved"
    @book.save
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :ISBN, :cover)
    end

end

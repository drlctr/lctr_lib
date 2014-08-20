class BooksController < ApplicationController
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

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    # @book = Book.new
  end

  # GET /books/1/edit
  def edit

  end

  # POST /books
  # POST /books.json
  def create
    # @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    p "book id is #{@book.id}"
    p "book title is #{@book.title}"
    p "before:  status #{@book.status}"
    @book.status = "approved"
    @book.save
    p "after: status #{@book.status}"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :ISBN, :cover)
    end

end

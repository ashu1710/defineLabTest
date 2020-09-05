class BooksController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_book, only: [:edit, :update, :destroy]
	before_action :get_authors, only: [:new, :edit]
	
	# list of all book
	def index
		@books = Book.all.includes(:authors)
	end

	# when admin click on new book
	def new
		@book = Book.new
		@authors = Author.all
	end

	# create a book
	def create
		@book = Book.create(book_params)
		if @book.save
			redirect_to books_path, flash: { success: 'Book created successfully.' }
		else
			flash[:error] =  @book.book_error
			render :new
		end
	end

	# update a book details
	def update
		if @book.present? && @book.update(book_params)
			flash[:success] = 'Book updated successfully.'
		else
			flash[:error] = 'Book not updated.'
		end
		redirect_to books_path
	end

	# remove book
	def destroy
		if @book.destroy
			flash[:success] = "Book deleted successfully."
		else
			flash[:error] = @book.author_error
		end
		redirect_to books_path
	end

	private

	#display all author list while create and update books
	def get_authors
		@authors = Author.all
	end


	#set book
	def set_book
		@book = Book.friendly.find(params[:id]) rescue nil
		unless @book.present?
			flash[:error] = "Book not found."
			redirect_to books_path
		end
	end

	def book_params
		params[:book][:author_ids] = [] unless params[:book][:author_ids].present? # remove all author in edit form
		params.require(:book).permit(:title, author_ids: [])
	end

end

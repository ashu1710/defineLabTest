class AuthorsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_authors, only: [:edit, :update, :destroy]
	before_action :get_books, only: [:new, :edit]
	
	# get list of all authors
	def index
		@authors = Author.all.includes(:books)
	end

	# while admin click on new author btn
	def new
		@author = Author.new
		@books = Book.all
	end

	# create new author
	def create
		@author = Author.create(author_params)
		if @author.save
			redirect_to authors_path, flash: { success: 'Author created successfully.' }
		else
			flash[:error] =  @author.author_error
			render :new
		end
	end

	# update author details
	def update
		if @author.present? && @author.update(author_params)
			flash[:success] = 'Author updated successfully.'
		else
			flash[:error] = 'Author not updated.'
		end
		redirect_to authors_path
	end

	# remove author
	def destroy
		if @author.destroy
			flash[:success] = "Author deleted successfully."
		else
			flash[:error] = @author.author_error
		end
		redirect_to authors_path
	end

	private

	#display all book list while create and update author
	def get_books
		@books = Book.all
	end

	# set author while we create, update, destroy author
	def set_authors
		@author = Author.friendly.find(params[:id]) rescue nil
		unless @author.present?
			flash[:error] = "Author not found."
			redirect_to authors_path
		end
	end

	def author_params
		params[:author][:book_ids] = [] unless params[:author][:book_ids].present? # remove all books in edit form
		params.require(:author).permit(:first_name, :last_name, :date_of_birth, book_ids: [])
	end

end

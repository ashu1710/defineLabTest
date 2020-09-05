class DashboardController < ApplicationController
	before_action :authenticate_admin!

	# display author and books count
	def index
		@count = { authors: Author.count, books: Book.count }
	end
end

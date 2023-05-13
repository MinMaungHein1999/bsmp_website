class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :published_date)
    end

end

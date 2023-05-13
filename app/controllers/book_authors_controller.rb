class BookAuthorsController < InheritedResources::Base

  private

    def book_author_params
      params.require(:book_author).permit(:book_id, :author_id)
    end

end

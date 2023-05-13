class BookCategoriesController < InheritedResources::Base

  private

    def book_category_params
      params.require(:book_category).permit(:book_id, :category_id)
    end

end

class AuthorsController < InheritedResources::Base

  private

    def author_params
      params.require(:author).permit(:name, :email, :phone, :address)
    end

end

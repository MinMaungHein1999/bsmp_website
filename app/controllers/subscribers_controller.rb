class SubscribersController < InheritedResources::Base

  private

    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end

end

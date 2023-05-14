module Api
  class SubscribersController < ApiController
    def create
      subscriber = Subscriber.new(subscriber_params)
      if subscriber.save
        render json: subscriber, status: :created
      else
        render json: subscriber.errors, status: :unprocessable_entity
      end
    end

    private

    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end
  end
end

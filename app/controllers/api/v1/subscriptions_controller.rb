
module Api
    module V1
      class SubscriptionsController < ApplicationController
        swagger_controller :subscriptions, 'Subscriptions'
  
        swagger_api :create do
          summary 'Create a new subscription'
          param :form, :name, :string, :required, 'Name'
          param :form, :email, :string, :required, 'Email'
          response :unprocessable_entity
          response :created
        end
  
        def create
            subscriber = Subscriber.new(subscription_params)
  
            if subscriber.save
                render json: subscriber, status: :created
            else
                render json: subscriber.errors, status: :unprocessable_entity
            end
        end
  
        private
  
        def subscription_params
          params.require(:subscription).permit(:name, :email)
        end
      end
    end
  end
  
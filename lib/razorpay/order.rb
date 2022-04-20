require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Order API allows you to associate
  # Payments with an order entity
  class Order < Entity
    def initialize(auth_settings: {}, attributes: {})
      super('orders', auth_settings: auth_settings, attributes: attributes)
    end

    def create(options)
      request.create options
    end

    def fetch(id)
      request.fetch id
    end

    def all(options = {})
      request.all options
    end

    def payments(options = {})
      request.request :get, "/orders/#{id}/payments", options
    end
  end
end

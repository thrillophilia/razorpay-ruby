require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Plan API allows you to create and
  # manage subscription-plans with Razorpay
  class Plan < Entity
    def initialize(auth_settings: {}, attributes: {})
      super('plans', auth_settings: auth_settings, attributes: attributes)
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
  end
end

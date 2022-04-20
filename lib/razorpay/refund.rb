require 'razorpay/request'
require 'razorpay/entity'

module Razorpay
  # Refund class handles all refund objects
  class Refund < Entity
    def initialize(auth_settings: {}, attributes: {})
      super('refunds', auth_settings: auth_settings, attributes: attributes)
    end

    def create(options)
      request.create options
    end

    def all(options = {})
      request.all options
    end

    def fetch(id)
      request.fetch id
    end
  end
end

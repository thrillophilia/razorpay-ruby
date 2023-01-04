require 'razorpay/card'
require 'razorpay/order'
require 'razorpay/errors'
require 'razorpay/refund'
require 'razorpay/invoice'
require 'razorpay/payment'
require 'razorpay/utility'
require 'razorpay/customer'
require 'razorpay/constants'
require 'razorpay/collection'
require 'razorpay/virtual_account'
require 'razorpay/plan'
require 'razorpay/subscription'
require 'razorpay/addon'
require 'razorpay/transfer'
require 'razorpay/subscription_registration'
require 'razorpay/settlement'
require 'razorpay/payment_link'
require 'razorpay/fund_account'
require 'razorpay/item'
require 'razorpay/qr_code'
require 'razorpay/payment_method'

# Base Razorpay module
module Razorpay
  class << self
    attr_accessor :custom_headers
  end

  def self.setup(key_id, key_secret)
    raise 'Setup interface is not supported, use with_credentials'
    # self.auth = { username: key_id, password: key_secret }
  end

  def self.headers=(headers = {})
    self.custom_headers = headers
  end

  def self.auth
    get_thread_credentials
  end

  def self.with_credentials(credentials)
    begin
      set_thread_credentials(credentials)
      yield
    ensure
      clear_thread_credentials
    end
  end

  def self.get_thread_credentials
    Thread.current[:razorpay_credentials]
  end

  def self.set_thread_credentials(credentials)
    Thread.current[:razorpay_credentials] = credentials.to_h.transform_keys(&:to_sym)
  end

  def self.clear_thread_credentials
    Thread.current[:razorpay_credentials] = nil
  end
end

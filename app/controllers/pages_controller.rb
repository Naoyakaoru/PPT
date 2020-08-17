class PagesController < ApplicationController
  # def index
  # end

  def about
  end

  def pricing
  end

  def payment
    @token = gateway.client_token.generate
    @plan = params[:plan]
    @price = case @plan
    when "a"
      5
    when "b"
      20
    else
      "參數錯誤"
    end
  end

  def checkout
    render html:params
  end

  private
  def gateway
    Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'ycjkmy7b48842kvj',
      :public_key => 'vcnsjmqndvvfb4ns',
      :private_key => '0de124ef8baaa27de12d11d84b2e4f3a',
    )
  end

end
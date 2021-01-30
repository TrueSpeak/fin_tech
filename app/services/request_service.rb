# RequestService
#
#   Used for create requests for authorization server
#
class RequestService
  prepend SimpleCommand

  attr_accessor :method, :url, :payload, :token

  def initialize(method, url, payload, token = nil)
    @method = method
    @url = url
    @payload = payload
    @token = token
  end

  def call
    if token
      request({ Authorization: token.to_s, content_type: 'json' })
    else
      request({ content_type: 'json' })
    end
  end

  private

  def request(headers)
    RestClient::Request.execute(
      method: method,
      url: url,
      headers: headers,
      payload: payload
    )
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end

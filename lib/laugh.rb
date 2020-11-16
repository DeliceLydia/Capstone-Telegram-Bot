require 'net/http'
require 'json'
require_relative 'bot'

class Laughter
  attr_reader :values

  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://api.yomomma.info'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end

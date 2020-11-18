require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Motivation
  attr_reader :values

  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
  end

  def make_the_request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end

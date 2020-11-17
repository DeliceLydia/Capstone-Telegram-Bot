require_relative '../lib/motive'
require_relative '../lib/laugh'

describe Motivation do
  let(:quote_of_the_day) { Motivation.new }

  describe '#initialize' do
    let(:values) { quote_of_the_day.values }
    it 'returns true for object passed into an array' do
      expect(values.is_a?(Array)).to be(true)
    end
  end

  describe '#select_random' do
    context 'selecting randomly' do
      it 'returns a key and a value' do
        expect(quote_of_the_day.select_random.length).to eql(2)
      end
    end

    it 'returns false for a hash having two key/value pairs' do
      expect(quote_of_the_day.select_random.length).not_to eql(1)
    end
  end

  describe '#make_the_request' do
    let(:request) { Motivation.new }

    it 'returns a Json if the request is right' do
      expect(request.make_the_request.class).to be(Array)
    end

    it 'should not return an empty array' do
      expect(request.make_the_request.length).not_to eql(0)
    end
  end
end

describe Laughter do
  describe '#make_the_request' do
    let(:joke_of_the_day) { Laughter.new }
    let(:request_joke) { joke_of_the_day.make_the_request }

    it 'should not return an empty array' do
      expect(request_joke.length).not_to eql(0)
    end

    it 'should return a hash if the request is right' do
      expect(request_joke.class).to eql(Hash)
    end
  end
end

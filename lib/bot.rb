# rubocop:disable Metrics/MethodLength

require 'telegram_bot'
require_relative 'motive'
require 'dotenv'
Dotenv.load('.env')

class Bot
  attr_reader :bot, :get_updates

  def initialize
    @bot = TelegramBot.new(ENV['token'])
    @get_updates = update
  end

  private

  def update
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        case command

        when '/start'
          reply.text = "Hello,
           welcome to the telegram bot created by Delice Lydia, Kindly use:
                    /start to start the bot,
                    /stop to end the bot,
                    /motivate to get different motivational quote
                    /laughter to get a joke of the day
                    /learn to learn a new french word
                    /movies know a new movie to watch"
        when '/learn'
          new_word = %w[
            salut/hello bonsoir/good,evening comment,tu,vas/how,are,you?
            je,vais,bien/i,am,fine tu,me,manque/i,miss,you
          ]
          reply.text = "#{new_word.sample.capitalize}, #{message.from.first_name}!"
        when '/motivate'
          values = Motivation.new
          value = values.select_random
          reply.text = (value['text'])
        when '/laughter'
          values = Laughter.new
          value = values.make_the_request
          reply.text = (value['joke'])
        when '/movies'
          new_movies = %w[jurassic,world avengers the,lion,king tigertail
                          the,assistant hamilton shirley star,is,born the,gentleman]
          reply.text = "#{new_movies.sample.capitalize}!"
        when '/stop'
          reply.text = "Bye, #{message.from.first_name}!"
        else reply.text = "Invalid entry, #{message.from.first_name}!,
          you need to use /start, /stop, /motivate, /laughter
          /movies, /learn"
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end

# rubocop:enable Metrics/MethodLength

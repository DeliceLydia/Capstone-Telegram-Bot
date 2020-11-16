# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity

require 'telegram/bot'
require_relative 'motive'

class Bot
  def initialize
    token = '1482463910:AAEhuRP9w5nbNq7-ia3nx9FlEdkqlbtWtQQ'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello,
           welcome to the telegram bot created by Delice Lydia, Kindly use:
                    /start to start the bot,
                    /stop to end the bot,
                    /motivate to get different motivational quote
                    /laughter to get a joke of the day
                    /learn to learn a new french word
                    /movies know a new movie to watch
                    /parfium get your brand new parfium
                    /help to get more info about the bot")
        when '/learn'
          new_word = %w[
            salut/hello bonsoir/good,evening comment,tu,vas/how,are,you?
            je,vais,bien/i,am,fine tu,me,manque/i,miss,you
          ]
          bot.api.send_message(chat_id: message.chat.id, text: "#{new_word.sample.capitalize}!", date: message.date)

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        when '/motivate'
          values = Motivate.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: (value['text']).to_s, date: message.date)

        when '/laughter'
          values = Joke.new
          value = values.make_the_request
          bot.api.send_message(chat_id: message.chat.id, text: (value['joke']).to_s, date: message.date)

        when '/parfium'
          new_parfium = %w[j,adore la,vie,est,belle dolce&gabbana mon,guerlain]
          bot.api.send_message(chat_id: message.chat.id, text: "#{new_parfium.sample.capitalize}!", date: message.date)

        when '/movies'
          new_movies = %w[jurassic,world avengers the,lion,king tigertail
                          the,assistant hamilton shirley star,is,born the,gentleman]
          bot.api.send_message(chat_id: message.chat.id, text: "#{new_movies.sample.capitalize}!", date: message.date)

        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: "
          /start to start the bot,
          /motivate to get different motivational quote
          /laughter to get a joke of the day
          /learn to learn a new french word
          /movies know a new movie to watch
          /parfium get your brand new parfium
          /help to get more info about the bot
          /stop to end the bot
          ")
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name},
          you need to use
          /start,
          /stop ,
          /motivate or /joke")
        end
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

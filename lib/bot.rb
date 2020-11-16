require "telegram/bot"
require_relative "motive.rb"

class Bot
  def initialize
    token = "1482463910:AAEhuRP9w5nbNq7-ia3nx9FlEdkqlbtWtQQ"
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when "/start"
          bot.api.send_message(chat_id: message.chat.id, text: "Hello,
           welcome to the telegram bot created by Delice Lydia, Kindly use: 
                    /start to start the bot,  
                    /stop to end the bot, 
                    /motivate to get different motivational quote 
                    /learn to learn a new french word 
                    /help to get more info about the bot")
        when "/learn"
          new_word = %w[lundi mardi mercredi jeudi vendredi samedi dimanche]
          bot.api.send_message(chat_id: message.chat.id, text: "#{new_word.sample.capitalize}!", date: message.date)

        when "/stop"
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        when "/motivate"
          values = Motivate.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value["text"]}", date: message.date)

        when '/laughter'
          values = Joke.new
          value = values.make_the_request
          bot.api.send_message(chat_id: message.chat.id, text: (value['joke']).to_s, date: message.date)
        
        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: 
          "
            /start: Start a new bot
            /motivate: Gives you different motivational quotes
            /learn: Teaches you a new french word
            /stop: End the bot
          ")
        
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate or /joke")
        end
      end
    end
  end
end

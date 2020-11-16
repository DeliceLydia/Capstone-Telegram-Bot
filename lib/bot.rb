require "telegram/bot"
require_relative "motive.rb"

class Bot
  def initialize
    token = "1482463910:AAEhuRP9w5nbNq7-ia3nx9FlEdkqlbtWtQQ"
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when "/start"
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to motivation chat bot created by Delice Lydia, the chat bot is to keep you motivated and entertained. 
                    Use /start to start the bot,  /stop to end the bot, /motivate to get a different motivational quote everytime you request for it or 
                    /learn to learn a new french word")
        when "/learn"
          new_word = %w[comment,tu,vas?]
          bot.api.send_message(chat_id: message.chat.id, text: "#{new_word.sample.capitalize}!", date: message.date)

        when "/stop"
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        when "/motivate"
          values = Motivate.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value["text"]}", date: message.date)
        
        when '/help'
          reply.text = "
            /start: Start a new bot
            /motivate: Gives you different motivational quotes
            /learn: Teaches you a new french word
            /stop: End the bot
          "
        
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate or /joke")
        end
      end
    end
  end
end

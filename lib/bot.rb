require 'telegram/bot'
require_relative 'motive.rb'

class Bot
  def initialize
    token = '1482463910:AAEhuRP9w5nbNq7-ia3nx9FlEdkqlbtWtQQ'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to motivation chat bot created by peter robert, the chat bot is to keep you motivated and entertained. 
                    Use  /start to start the bot,  /stop to end the bot, /motivate to get a diffrent motivational quote everytime you request for it or 
                    /joke to get a joke everytime you request for it")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        when '/fitness'
        when '/motivate'
          values = Motivate.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value["text"]}", date: message.date)
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate or /joke")
        end
      end
    end
  end
end

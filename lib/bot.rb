require 'telegram/bot'

class Bot
    attr_reader :bot, :updates

    def initialize
        token: '1482463910:AAEhuRP9w5nbNq7-ia3nx9FlEdkqlbtWtQQ'
        @bot = TelegramBot.new(token: token)
        @updates = update
    end

    private

    def update
        
    end

end
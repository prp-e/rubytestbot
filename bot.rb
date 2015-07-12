require 'telegram/bot'

token = '90643661:AAHtnhrao2TyoA5VPGBIWDbBaUEkwDB2WRA'

Telegram::Bot::Client.run(token) do |bot|
 bot.listen do |message|
  case message.text
	when '/start'
	 bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.username}, I'm ruby test bot and made by Muhammadreza Haghiri")
	when '/stop'
	 bot.api.sendMessage(chat_id: message.chat.id, text : "Bye, #{message.from.username}")
	when '/help'
	 bot.api.sendMessage(chat_id: message.chat.id, text : "Use /start, /stop and /reverse commands")
	when '/reverse'
	 bot.api.sendMessage(chat_id: message.chat.id, text : message.text[9, message.length].reverse.downcase.capitalize)
	end
 end
end

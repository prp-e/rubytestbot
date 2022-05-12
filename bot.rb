require 'telegram/bot'

token = ENV['BOT_API']

#API TOKEN IS AUTOMATICALLY GENERATED BY BOT FATHER

Telegram::Bot::Client.run(token) do |bot|
 bot.listen do |message|
  case message.text
	when '/start'
	 bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.username}, I'm ruby test bot and made by Muhammadreza Haghiri and chat ID is #{message.chat.id}")
	when '/stop'
	 bot.api.sendMessage(chat_id: message.chat.id, text: "Bye, #{message.from.username}")
	when '/help'
	 bot.api.sendMessage(chat_id: message.chat.id, text: "Use /start, /stop and /reverse commands")
	when '/reverse'
	 bot.api.sendMessage(chat_id: message.chat.id, text: message.text[9, message.length].reverse.downcase.capitalize)
	 #For this, you need to give access to all messages, using /setprivacy command in BotFather
	when '/img'
	 bot.api.sendPhoto(chat_id: message.chat.id, photo: File.new('./img.png'))
	end
 end
end

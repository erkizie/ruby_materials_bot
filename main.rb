#coding: UTF-8

require 'telegram/bot'

TOKEN = ENV['TELEGRAM_BOT_API_TOKEN']

HTML = "1) HTML за 1 час: https://www.youtube.com/watch?v=5pBcKKiZSGE - неплохое видео для краткого ознакомления с HTML.
2) Курс Евгения Попова по HTML. Курс 2011 года, но он даёт очень хорошие базовые знания данной технологии: https://www.youtube.com/playlist?list=PLB86E02CE3735E3B6
3) Закрепить и актуализировать знания: http://htmlbook.ru/blog/samouchitel-html-1
4)Практика: https://htmlacademy.ru/"

CSS = "1) CSS за 1 час: https://www.youtube.com/watch?v=iPV5GKeHyV4 - неплохое видео для краткого ознакомления с CSS.
2) Курс Евгения Попова по CSS. Устаревший, но очень подробный курс, который даст Вам базовые навыки технологии и покажет, как это работает: https://www.youtube.com/playlist?list=PL6855EFB2BC8B7C7B
3) Самоучитель CSS: http://htmlbook.ru/samcss
4) Практика: https://htmlacademy.ru/"

RUBY = "1) Курс Романа Пушкина, я считаю его лучшим вариантом начала изучения языка и программирования как такового. К концу курса вы уже будете владеть довольно хорошим запасом знаний, для самостоятельного продолжения: http://rubyschool.us/
2) Книга 'The Ruby Programming Language' от Юкихиро Мацумото, создателя языка. Основа основ.
3) Книга 'Well Grounded Rubyist'. После неё вы закрепите знание языка и начнёте мыслить в ruby-стиле.
4) Книга 'Ruby on Rails Tutorial' Michael Hartl. Лучшая книга для изучения основ фреймворка Rails. После прочтения, вы будете довольно неплохо разбираться в Rails, понимать основы технологий html, css, javascript, стиля разработки TDD, принципа DRY и много другого.
5) Книга 'Agile Web Development with Rails' by Sam Ruby. Книга посвящена Agile стилю разработки Ruby-приложений."

JScript = "Скоро появится :)"

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      question = "Здравствуй, #{message.from.first_name}.\n" +
              "Я бот, который поможет тебе начать изучение Ruby, Rails, HTML, CSS, JavaScript. Просто спроси меня, а я дам тебе список источников, которые будут тебе полезны."
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(HTML CSS), %w(Ruby Javascript)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    when '/html', 'HTML'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: HTML)
    when '/css', 'CSS'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: CSS)
    when '/ruby', 'Ruby'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: RUBY)
    when '/javascript', 'Javascript', 'JS', 'js'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: JScript)
    end

  end
end

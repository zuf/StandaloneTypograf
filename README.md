# StandaloneTypograf

**StandaloneTypograf** — gem для подготовки текста к публикации (замена кавычек на «ёлочки», тире и знаков ©). 
Аналог «Типографа» студии Лебедева или сервисов подобных http://typograf.ru

     "Струйка воды толщиной в одну спичку даёт утечку "200 литров в сутки!"", - сказал Афоня (c) 
     
     «Струйка воды толщиной в одну спичку даёт утечку „200 литров в сутки!“», — сказал Афоня ©


Ключевое отличие **StandaloneTypograf** от прочих типографских гемов: 

 - автономность (самостоятельная обработка текста не зависящая от сторонних сайтов и сервисов);
 - выполняет прямую функцию (не преобразует в html, работает с plain текстом, UTF-8 символы (© вместо &#169)
 - высокая скорость


## Benchmark

Для теста была взята книга Андрея Кочергина «Как закалялась сталь 2» (954 строки, 32 000 слов, 757 знаков тире [-], 752 кавычки ["])

В тесте принимали участие следующие гемы:
 - **typograf**, **multi_typograf** *(обертка сервиса typograf.ru)*;
 - **als_typograf** *(обертка сервиса artlebedev.ru/tools/typograf/)*;
 - **Gilenson** *(RuTils)*.

Результаты тестирования:
 1. **StandaloneTypograf, результат: 0,143 секунды** 
 2. Gilenson, результат: 0.764 секунды (медленее в 5 раз) 
 3. typograf, multi_typograf, выдали ошибку (макс. размер текста = 50 Kb)
 3. als_typograf, выдал ошибку (макс. размер текста = 32 Kb)
 
## Installation

Ruby 1.9.3 - 2.0.0; Rails 3

Add this line to your application's Gemfile:

    gem 'standalone_typograf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install standalone_typograf
    

## Использование

Пример использования:

     require 'standalone_typograf'
     
     text = StandaloneTypograf::Typograf.new('"StandaloneTypograf" - простой и быстрый, его можно использовать "на лету"')
     text.dasherize # Преобразует все тире
     text.signs # Заменит знаки (с) => ©
     text.quotes # Преобразует кавычки
     
     # Эти три метода можно заменить одной: prepare
     text.prepare # => «StandaloneTypograf» — простой и быстрый, его можно использовать «на лету»

## Параметры
### Переопределение или добавление знаков

Чтобы переопределить знаки по-умолчанию или добавить собственные, передайте хеш *signs* или *signs_ru* (для русских заменяемых обозначений) 'знак' => 'заменяемый текст'. 
Текст будет заменён только если он указан в круглых скобочках.

    text = StandaloneTypograf::Typograf.new('(copy) 2013', signs: {'©' => 'copy'} )
    text.signs # => "© 2013"

### Переопределение кавычек

Чтопы переопределить кавычки (outer: внешние, inner: внутренние) передайте хеш quotes с ключем outer/inner и массивом из двух символов (левая и правая кавычки):
     
    text = StandaloneTypograf::Typograf.new('"Мерседес"', quotes:  { outer: ['&laquo;', '&raquo;'] } )
    text.quotes # => "&laquo;Мерседес&raquo;'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

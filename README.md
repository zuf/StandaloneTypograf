# StandaloneTypograf

**StandaloneTypograf** — gem для подготовки текста к публикации (замена кавычек на «ёлочки», тире и знаков ©). 
Аналог «Типографа» студии Лебедева или сервисов подобных http://typograf.ru

Ключевое отличие **StandaloneTypograf** от прочих типографских гемов — автономность (самостоятельная обработка текста не зависящая от сторонних сайтов и сервисов).

     - Струйка воды толщиной в одну спичку даёт утечку "200 литров в сутки!" 
     (c) Афоня
     
     — Струйка воды толщиной в одну спичку даёт утечку «200 литров в сутки!» 
     © Афоня
 
## Installation

Ruby 1.9.3 - 2.0.0; Rails 3

Add this line to your application's Gemfile:

    gem 'standalone_typograf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install standalone_typograf
    

## Использование


## Параметры
### Знаки по-умолчанию
    SIGNS = {
        '©' => 'c',
        '™' => 'tm',
        '®' => 'r',
    }
    SIGNS_RU = {
        '©' => 'с',
        '™' => 'тм',
        '®' => 'р',
    }

Чтобы переопределить знаки по-умолчанию или добавить собственные, передайте хеш *signs* или *signs_ru* (для русских заменяемых обозначений) 'знак' => 'заменяемый текст'. 
Текст будет заменён только если он указан в круглых скобочках.

    text = StandaloneTypograf::Typograf.new('(copy) 2013', signs: {'©' => 'copy'} )
    text.signs # => "© 2013"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

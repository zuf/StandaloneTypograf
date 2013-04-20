![StandaloneTypograf](https://raw.github.com/shlima/StandaloneTypograf/master/doc/logo.png)

**StandaloneTypograf** — gem для подготовки текста к публикации или типографирования текста на лету (вывод комментариев, например)

    Пушкин писал Дельвигу: "Жду "Цыганов" и тотчас тисну...", (c) 1827 - А. С. Пушкин

Превратится в:
    
    Пушкин писал Дельвигу: «Жду „Цыганов“ и тотчас тисну…», © 1827 — А. С. Пушкин
    
Пример работы (онлайн типограф): http://typograf.herokuapp.com
    
## Возможности

- замена кавычек (поддерживаются внутренние и внешние кавычки);
- замена знаков (с), (тм), (р) на аналогичные ©, ™, ®. Буква в скобке может быть как английской, так и русской;
- замена знака ±
- короткое тире (между числами без отбивки);
- подстановка длинного тире (с использованием неразрывного пробела);
- привязка  одно- и двухбуквенных слов к следующему за ними слову с помощью неразрывного пробела;
- привязка частиц (>=3) к предыдущему слову с помощью неразрывного пробела;
- замена всех 19 цельных символов дробей европейского вида, поддерживаемых стандартом Юникод.

## Отличия **StandaloneTypograf**

 - автономность (самостоятельная обработка текста не зависящая от сторонних сайтов и сервисов);
 - выполняет прямую функцию (не преобразует в html, работает с plain текстом, UTF-8 символы (© вместо &copy);
 - корректная обработка двойных кавычек (в отличие от gilenson);
 - высокая скорость;
    
## Использование

Пример использования:

     require 'standalone_typograf'
     
     text = StandaloneTypograf::Typograf.new('"StandaloneTypograf" - простой и быстрый, его можно использовать "на лету"')
     text.dasherize # Преобразует все тире
     text.signs # Заменит знаки (с) => ©
     text.quotes # Преобразует кавычки
     
     # Эти три метода можно заменить одной командой: prepare
     text.prepare # => «StandaloneTypograf» — простой и быстрый, его можно использовать «на лету»  
     
## Параметры
### Вызов определенных обработчиков

Вы можете вызвать только нужные вам типографы или использовать все одной командой *prepare*. Список поддерживаемых типографов:

- dasherize (тире)
- signs (символы)
- quotes (кавычки)
- dots (многоточие)
- endash (короткое тире)
- nbspace (неразрывные пробелы)
- fractions (дроби)

Или наоборот, вы можете исключить ненужный вам типограф, передав символьный массив в параметре *except* с ненужными обработчиками:

    require 'standalone_typograf'
    text = StandaloneTypograf::Typograf.new('(c) А. А. Шилов', except: [:fractions])
    # Выполнит все преобразования кроме замены дробей
    text.prepare
    
### Переопределение или добавление знаков

Чтобы переопределить знаки по-умолчанию или добавить собственные, передайте хеш *signs* или *signs_ru* (для русских заменяемых обозначений) 'заменяемый текст (в формате *regexp*)' => 'знак'. 

    text = StandaloneTypograf::Typograf.new('(copy) 2013', signs: {'[(]copy[)]' => '©'})
    text.signs # => "© 2013"

### Переопределение кавычек

Чтобы переопределить кавычки (outer: внешние, inner: внутренние) передайте хеш quotes с ключем outer/inner и массивом из двух символов (левая и правая кавычки):
     
    text = StandaloneTypograf::Typograf.new('"Мерседес"', quotes:  { outer: ['&laquo;', '&raquo;'] } )
    text.quotes # => "&laquo;Мерседес&raquo;'

## Installation

Ruby 1.9.3 - 2.0.0; Rails 3-4

Add this line to your application's Gemfile:

    gem 'standalone_typograf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install standalone_typograf

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
    
    

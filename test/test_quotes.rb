#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class QuotesTest < Test::Unit::TestCase
  def test_quotes_o_i
    text = StandaloneTypograf::Typograf.new('"Два "вида" "кавычек"" "Жесть"')
    should = '«Два „вида“ „кавычек“» «Жесть»'
    assert_equal text.quotes, should
  end
  def test_quotes_o
    text = StandaloneTypograf::Typograf.new('"Один", "Два", "Три"')
    should = '«Один», «Два», «Три»'
    assert_equal text.quotes, should
  end
  def test_quotes_redefinition
    text = StandaloneTypograf::Typograf.new('"Один", "Два", "Три"', quotes: {outer: ['**', '**;']})
    should = '**Один**;, **Два**;, **Три**;'
    assert_equal text.quotes, should
  end
  def test_double_quotes_nearby
    text = StandaloneTypograf::Typograf.new('""Гномы", - вскрикнул Бильбо", - сказал Толкиен')
    should = '«„Гномы“, - вскрикнул Бильбо», - сказал Толкиен'
    assert_equal text.quotes, should
  end
  def test_double_quotes_nearby_last
    text = StandaloneTypograf::Typograf.new('"Привет тебе, "Путник""')
    should = '«Привет тебе, „Путник“»'
    assert_equal text.quotes, should
  end
end
#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class StandaloneTypografTest < Test::Unit::TestCase
  def test_dasherize_left
    text = StandaloneTypograf::Typograf.new('Привет,- это длинное тире!')
    should = 'Привет,— это длинное тире!'
    assert_equal text.dasherize, should
  end

  def test_dasherize_hyphen
    text = StandaloneTypograf::Typograf.new('Яблоко - это фрукт. То-то и оно.')
    should = 'Яблоко — это фрукт. То-то и оно.'
    assert_equal text.dasherize, should
  end

  def test_no_dashes
    text = StandaloneTypograf::Typograf.new('Яблоко есть фрукт.')
    should = 'Яблоко есть фрукт.'
    assert_equal text.dasherize, should
  end
end
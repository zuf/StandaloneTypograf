#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class DotsTest < Test::Unit::TestCase
  def test_dots
    text = StandaloneTypograf::Typograf.new('Дубровский молчал...')
    should = 'Дубровский молчал…'
    assert_equal text.dots, should
  end

  def test_two_dots
    text = StandaloneTypograf::Typograf.new('Да что тут предлагать?..')
    should = 'Да что тут предлагать?..'
    assert_equal text.dots, should
  end

  def test_range
    text = StandaloneTypograf::Typograf.new('Труба длиной 5...10 м.')
    should = 'Труба длиной 5…10 м.'
    assert_equal text.dots, should
  end
end
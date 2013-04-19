#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class EndashTest < Test::Unit::TestCase
  def test_endash
    text = StandaloneTypograf::Typograf.new('- В 2006-2012 годах я учился в каком-то университете.')
    should = '- В 2006–2012 годах я учился в каком-то университете.'
    assert_equal text.endash, should
  end
end
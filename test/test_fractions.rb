#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class FractionsTest < Test::Unit::TestCase
  # Дроби
  def test_fractions
    text = StandaloneTypograf::Typograf.new('В 1/3 всей воды на планете содержится 2/10 углекислого газа. 102/303')
    should = 'В ⅓ всей воды на планете содержится 2/10 углекислого газа. 102/303'
    assert_equal text.fractions, should
  end
end
#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class NbspaceTest < Test::Unit::TestCase
  def test_prepare_1word
    # Неразрывный пробел справа от 'я' и 'в'
    text = StandaloneTypograf::Typograf.new('Давно я ходил в лес')
    should = 'Давно я ходил в лес'
    assert_equal text.nbspace, should
  end
  def test_prepare_2words
    # Неразрывный пробел справа от 'за'
    text = StandaloneTypograf::Typograf.new('Сходи за пивом')
    should = 'Сходи за пивом'
    assert_equal text.nbspace, should
  end

  def test_particles
    # У частиц неразрывный пробел слева
    text = StandaloneTypograf::Typograf.new('Саша якобы принес водку')
    should = 'Саша якобы принес водку'
    assert_equal text.nbspace, should
  end
end
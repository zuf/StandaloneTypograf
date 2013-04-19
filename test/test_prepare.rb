#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class PrepareTest < Test::Unit::TestCase
  def test_prepare
    source = <<-PLAIN
    (р) 2013 кто-то, кого нельзя называть. "Артемий лебедев(тм), - "Взял мяч - хуяч"(с)"
    PLAIN
    text = StandaloneTypograf::Typograf.new(source)
    should = <<-PLAIN
    ® 2013 кто-то, кого нельзя называть. «Артемий лебедев™, — „Взял мяч — хуяч“©»
    PLAIN
    assert_equal text.prepare, should
  end

  def test_prepare_redefinition
    source = <<-PLAIN
    (р) 2013 кто-то, кого нельзя называть. "Артемий лебедев(тм), - "Взял мяч - хуяч"(с)"
    PLAIN
    text = StandaloneTypograf::Typograf.new(source, quotes: {outer: ['&laquo;', '&raquo;']})
    should = <<-PLAIN
    ® 2013 кто-то, кого нельзя называть. &laquo;Артемий лебедев™, — „Взял мяч — хуяч“©&raquo;
    PLAIN
    assert_equal text.prepare, should
  end

  def test_except
    text = StandaloneTypograf::Typograf.new('1/2+1/3', except: [:fractions])
    should = '1/2+1/3'
    assert_equal text.prepare, should
  end
end
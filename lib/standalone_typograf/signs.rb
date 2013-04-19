# encoding: UTF-8

module StandaloneTypograf
  module Signs

    SIGNS = {
        '[(]c[)]' => '©',
        '[(]tm[)]' => '™',
        '[(]r[)]' => '®',
        '[+][-]' => '±',
    }
    SIGNS_RU = {
        '[(]с[)]' => '©',
        '[(]тм[)]' => '™',
        '[(]р[)]' => '®',
    }

    def signs
      source = @signs.merge(@signs_ru).merge(SIGNS).merge(SIGNS_RU)
      source.each_pair do |text, sign|
        @text = @text.gsub(/#{text}/i, sign)
      end
      @text
    end
  end
end

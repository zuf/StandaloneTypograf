# encoding: UTF-8

module StandaloneTypograf
  module Fractions
    FRACTIONS = {
        '1/4' => '¼',
        '1/2' => '½',
        '3/4' => '¾',
        '1/7' => '⅐',
        '1/9' => '⅑',
        '1/10' => '⅒',
        '1/3' => '⅓',
        '2/3' => '⅔',
        '1/5' => '⅕',
        '2/5' => '⅖',
        '3/5' => '⅗',
        '4/5' => '⅘',
        '1/6' => '⅙',
        '5/6' => '⅚',
        '1/8' => '⅛',
        '3/8' => '⅜',
        '5/8' => '⅝',
        '7/8' => '⅞',
        '0/3' => '↉'
    }

    def fractions
      FRACTIONS.each_pair do |text, sign|
        #@text = @text.gsub(/#{text}/i, sign)
        @text = @text.gsub(/(\D)([#{text[0]}][\/][#{text[2]}])(\D)/i, '\1' + sign + '\3')
      end
      @text
    end
    end
end
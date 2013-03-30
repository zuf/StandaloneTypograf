#encoding: UTF-8

module StandaloneTypograf
  module Signs

    SIGNS = {
        '©' => 'c',
        '™' => 'tm',
        '®' => 'r',
    }
    SIGNS_RU = {
        '©' => 'с',
        '™' => 'тм',
        '®' => 'р',
    }

    def signs
      result = @text.clone
      @signs.each_pair do |sign, text|
        result.gsub!(/[(]#{text}[)]/i, sign)
      end
      @signs_ru.each_pair do |sign, text|
        result.gsub!(/[(]#{text}[)]/i, sign)
      end
      @text = result
    end
  end
end

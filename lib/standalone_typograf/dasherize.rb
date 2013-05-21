# encoding: UTF-8

module StandaloneTypograf
  module Dasherize
    def dasherize
      # В ситуации, когда тире с отбивкой с обоих сторон,
      # левый пробел - неразрывный.
      @text = @text.gsub(/\s(-|—)\s/i, ' — ')
      @text = @text.gsub(/(-|—) /i, '— ')
    end
  end
end
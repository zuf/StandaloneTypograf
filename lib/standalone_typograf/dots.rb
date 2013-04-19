#encoding: UTF-8

module StandaloneTypograf
  module Dots
    def dots
      @text = @text.gsub(/[.][.][.]/i, '…')
    end
  end
end
# encoding: UTF-8

module StandaloneTypograf
  module Endash
    def endash
      @text = @text.gsub(/(\d+)([-])(\d+)/i, '\1'+'–'+'\3')
    end
  end
end
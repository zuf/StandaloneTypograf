#encoding: UTF-8

require 'standalone_typograf/version'
require 'standalone_typograf/dasherize'
require 'standalone_typograf/signs'

module StandaloneTypograf
  class Typograf
    include StandaloneTypograf::Dasherize
    include StandaloneTypograf::Signs

    def initialize(text, signs: SIGNS, signs_ru: SIGNS_RU)
      @signs, @signs_ru = SIGNS.merge(signs), SIGNS_RU.merge(signs_ru)
      @text = text
    end

  end
end

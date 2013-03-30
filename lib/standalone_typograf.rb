#encoding: UTF-8

require 'standalone_typograf/version'
require 'standalone_typograf/dasherize'
require 'standalone_typograf/signs'
require 'standalone_typograf/quotes'

module StandaloneTypograf
  class Typograf
    include StandaloneTypograf::Dasherize
    include StandaloneTypograf::Signs
    include StandaloneTypograf::Quotes

    def initialize(text, options={})
      options[:signs] ||= SIGNS
      options[:signs_ru] ||= SIGNS_RU
      options[:quotes] ||= QUOTES
      @signs, @signs_ru = SIGNS.merge(options[:signs]), SIGNS_RU.merge(options[:signs_ru])
      @quotes = QUOTES.merge(options[:quotes])
      @text = text
    end

    def prepare
      self.dasherize
      self.signs
      self.quotes
      @text
    end
  end
end

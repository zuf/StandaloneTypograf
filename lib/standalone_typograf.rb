# encoding: UTF-8

require 'standalone_typograf/version'
require 'standalone_typograf/dasherize'
require 'standalone_typograf/signs'
require 'standalone_typograf/quotes'
require 'standalone_typograf/dots'
require 'standalone_typograf/endash'
require 'standalone_typograf/nbspace'
require 'standalone_typograf/fractions'

module StandaloneTypograf
  class Typograf
    include StandaloneTypograf::Dasherize
    include StandaloneTypograf::Signs
    include StandaloneTypograf::Quotes
    include StandaloneTypograf::Dots
    include StandaloneTypograf::Endash
    include StandaloneTypograf::Nbspace
    include StandaloneTypograf::Fractions

    def initialize(text, options={})
      options[:signs] ||= SIGNS
      options[:signs_ru] ||= SIGNS_RU
      options[:quotes] ||= QUOTES
      # except - массив с названием методов, которые необходимо исключить при выполнении
      # *prepare*
      @except = options[:except]
      @signs, @signs_ru = SIGNS.merge(options[:signs]), SIGNS_RU.merge(options[:signs_ru])
      @quotes = QUOTES.merge(options[:quotes])
      @text = text
    end

    def prepare
      call_method :dasherize
      call_method :signs
      call_method :quotes
      call_method :dots
      call_method :endash
      call_method :nbspace
      call_method :fractions
      @text
    end

    # PRIVATE
    #
    private

    # Выполняет метод только если он не был передан в параметре 'except'
    # при создании объекта.
    #
    def call_method(name)
      if @except.nil? || !@except.include?(name)
        self.send(name)
      end
    end
  end
end

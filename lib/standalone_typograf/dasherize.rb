module StandaloneTypograf
  module Dasherize
    def dasherize
      @text = @text.gsub(/- /i, '— ')
    end
  end
end

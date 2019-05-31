require 'ripper'

module ExportStrings
  class ByLex
    class << self
      def execute(rb_text)
         Ripper.lex(rb_text)
      end
    end
  end
end
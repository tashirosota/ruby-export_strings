require 'export_strings/by_lex'
require 'export_strings/by_sexp'

module ExportStrings
  class Core
    class << self
      def execute(rb_text)
        # ByLex.execute(rb_text)
        BySexp.execute(rb_text)
      end
    end
  end
end

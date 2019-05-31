require 'export_strings/by_lex'
require 'export_strings/by_sexp'

module ExportStrings
  class Core
    class << self
      def execute(rb_text, with_embexpr: true)
        with_embexpr ? ByLex.execute(rb_text) : BySexp.execute(rb_text)
      end

      # 文字列展開は除外したい時
      def execute_with_out_embexpr(rb_text)
        execute rb_text, with_embexpr: false
      end
    end
  end
end

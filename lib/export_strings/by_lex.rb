require 'ripper'

module ExportStrings
  class ByLex
    class << self
      # is_string = trueのときは
      # on_tstring_beg ~ on_tstring_end || on_heredoc_beg　~ on_heredoc_endまでを文字列として扱う[]
      @is_string = false

      def execute(rb_text)
        pp Ripper.lex(rb_text)
      end
    end
  end
end
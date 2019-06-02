require 'ripper'

module ExportStrings
  class ByLex
    class << self
      def execute(rb_text)
        @string_flag = false
        @embexpr_flag = false
        @str = ''
        results = []
        Ripper.lex(rb_text).each do |ary_code|
          code_type = ary_code[1]
          code_content = ary_code[2]
          if embexpr_flag(code_type)
            @str << code_content
            next
          end

          if string_flag(code_type)
            next if code_type == :on_tstring_beg || code_type == :on_heredoc_beg

            @str << code_content
          elsif !string_flag(code_type) && !@str.empty?
            results.push @str
            @str = ''
          end
        end
        results
      end

      private

      # string_flag = trueのときは
      # on_tstring_beg ~ on_tstring_end || on_heredoc_beg　~ on_heredoc_endまでを
      # 文字列として扱う
      def string_flag(code_type)
        @string_flag = case code_type
                       when :on_tstring_beg
                         true
                       when :on_heredoc_beg
                         true
                       when :on_tstring_end
                         false
                       when :on_heredoc_end
                         false
                       else
                         @string_flag
                       end
      end

      # 文字列展開対応
      def embexpr_flag(code_type)
        @embexpr_flag = case code_type
                        when :on_embexpr_beg
                          true
                        when :on_embexpr_end
                          false
                        else
                          @embexpr_flag
                        end
      end
    end
  end
end
require 'ripper'

module ExportStrings
  class Core
    class << self
      def execute(rb_text)
        @str_nodes = []
        pp Ripper.sexp(rb_text)
        recursively_push_str_nodes Ripper.sexp(rb_text)
        pp @str_nodes
        to_strings @str_nodes
      end

      private

      def recursively_push_str_nodes(tree)
        tree.each do |node|
          if node.class == Array && node[0] == :string_content
            @str_nodes << node
          elsif node.class == Array
            recursively_push_str_nodes(node)
          end
        end
      end

      def to_strings(nodes)
        nodes.map { |node| str_content_node2str node }
      end

      def str_content_node2str
        str_content_node2str.reduce('') do |acc, leaf|
          str = case leaf[0]
                when :@tstring_content
                  leaf[1]
                when :string_embexpr
                  leaf[1][0][1][1]
                else
                  raise Error
                end
          acc + str
        end
      end
    end
  end
end

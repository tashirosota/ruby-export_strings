require 'ripper'

module ExportStrings
  class Core
    class << self
      def execute(rb_text)
        @str_nodes = []
        recursively_push_str_nodes Ripper.sexp(rb_text)
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
        nodes.map do |node|
          @string = ''
          str_content_node2str node
        end
      end

      def str_content_node2str(string_content_node)
        string_content_node.each do |leaf|
          if leaf.class == Array && leaf[0] == :@tstring_content
            @string << leaf[1]
          elsif leaf.class == Array
            str_content_node2str(leaf)
          end
        end
        @string
      end
    end
  end
end

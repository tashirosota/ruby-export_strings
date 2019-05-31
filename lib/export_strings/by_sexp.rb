require 'ripper'

module ExportStrings
  # 文字列展開ムツカシイ、、、
  class BySexp
    class << self
      def execute(rb_text)
        pp Ripper.sexp(rb_text)
        str_content_nodes = recursively_push_for_str_content_nodes Ripper.sexp(rb_text), []
        content_nodes2str_ary str_content_nodes
      end

      private

      # 再帰的にstring_literal nodeを集めてくる
      def recursively_push_for_str_content_nodes(tree, nodes)
        tree.each do |node|
          if node.class == Array && node[0] == :string_content
            nodes << node
          elsif node.class == Array
            recursively_push_for_str_content_nodes(node, nodes)
          end
        end
        nodes
      end

      # nodesをstringsに変換して返す
      def content_nodes2str_ary(nodes)
        nodes.map { |node| str_content_node2str node, '' }
      end

      # 各nodeをstringに変換する
      def str_content_node2str(string_content_node, str)
        string_content_node.each do |leaf|
          if leaf.class == Array && leaf[0] == :@tstring_content
            # 通常のstringが格納される時
            str << leaf[1]
          elsif leaf.class == Array && leaf[0] == :@string_embexpr
            # 文字列展開の時
            str << str_embexpr2str(leaf[1])
          elsif leaf.class == Array
            str_content_node2str(leaf, str)
          end
        end
        str
      end

      # string_embexprをstringに変換する
      def str_embexpr2str(string_embexpr_node)
        # pending
      end
    end
  end
end

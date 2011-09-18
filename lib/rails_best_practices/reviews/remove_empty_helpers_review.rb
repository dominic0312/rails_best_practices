# encoding: utf-8
require 'rails_best_practices/reviews/review'

module RailsBestPractices
  module Reviews
    # Review a helper file to make sure it is not an empty moduel.
    #
    # See the best practice details here http://rails-bestpractices.com/posts/72-remove-empty-helpers.
    #
    # Implementation:
    #
    # Review process:
    #   check all helper files, if the body of module is nil, then the helper file should be removed.
    class RemoveEmptyHelpersReview < Review
      def url
        "http://rails-bestpractices.com/posts/72-remove-empty-helpers"
      end

      def interesting_files
        HELPER_FILES
      end

      def interesting_nodes
        [:module]
      end

      # check the body of module node, if it is nil, then it should be removed.
      def start_module(node)
        if s(:bodystmt, s(:stmts_add, s(:stmts_new), s(:void_stmt)), nil, nil, nil) == node.body
          add_error "remove empty helpers", node.file, node.line
        end
      end
    end
  end
end
module CoreExtensions
  module String

    ##
    # Convert to hash from a query string.
    #
    #   "FooBar".snake_case           #=> "foo_bar"
    #   "HeadlineCNNNews".snake_case  #=> "headline_cnn_news"
    #   "CNN".snake_case              #=> "cnn"
    #
    # @return [Hash] Receiver converted to snake case.
    #
    # @api public
    def from_query
      uri = Addressable::URI.new
      uri.query = self
      uri.query_values
    end

    ##
    # Convert a constant name to a path, assuming a conventional structure.
    #
    #   "FooBar::Baz".to_const_path # => "foo_bar/baz"
    #
    # @return [String] Path to the file containing the constant named by receiver
    #   (constantized string), assuming a conventional structure.
    #
    # @api public
    def to_const_path
      snake_case.gsub(/::/, "/")
    end

    ##
    # Convert to snake case.
    #
    #   "FooBar".snake_case           #=> "foo_bar"
    #   "HeadlineCNNNews".snake_case  #=> "headline_cnn_news"
    #   "CNN".snake_case              #=> "cnn"
    #
    # @return [String] Receiver converted to snake case.
    #
    # @api public
    def snake_case
      return downcase if match(/\A[A-Z]+\z/)
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z])([A-Z])/, '\1_\2').
      downcase
    end
  end
end

class String
  include CoreExtensions::String
end


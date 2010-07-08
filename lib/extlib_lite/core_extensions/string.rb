module CoreExtensions
  module String

    ##
    # Convert to hash from a query string.
    #
    # "text_message%5Bto%5D=61447100308&text_message%5Bfrom%5D=61447100547&text_message%5Bmsg%5D=Edin%20knif%20lie%20km&text_message%5Bdate%5D=2010-05-13%2023%3A59%3A58".from_query #=> {
    #   "text_message"=>{
    #     "to"=>"61447100308",
    #     "from"=>"61447100547",
    #     "msg"=>"Edin knif lie km",
    #     "date"=>"2010-05-13 23:59:58"
    #   }
    # }
    #
    # @return [Hash] Query string converted to hash.
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


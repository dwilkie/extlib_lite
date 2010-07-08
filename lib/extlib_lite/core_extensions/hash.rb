module CoreExtensions
  module Hash
    ##
    # Convert to a query string
    #
    # {
    #   :text_message => {
    #     :to => 61447100308,
    #     :from => 61447100547,
    #     :msg => "Edin knif lie km"
    #     :date => "2010-05-13 23:59:58"
    #   }
    # }.to_query #=> "text_message%5Bto%5D=61447100308&text_message%5Bfrom%5D=61447100547&text_message%5Bmsg%5D=Edin%20knif%20lie%20km&text_message%5Bdate%5D=2010-05-13%2023%3A59%3A58"
    #
    # @return [String] Hash converted to a query string
    #
    # @api public
    def to_query
      uri = Addressable::URI.new
      uri.query_values = self.stringify
      uri.query.gsub("[", "%5B").gsub("]", "%5D")
    end

    def stringify
      Marshal.load(Marshal.dump(self)).stringify!
    end

    # Destructively convert all keys and values to strings
    def stringify!
      keys.each do |key|
        new_key = key.to_s
        self[new_key] = delete(key)
        if self[new_key].is_a?(Hash)
          self[new_key].stringify!
        else
          self[new_key] = delete(new_key).to_s
        end
      end
      self
    end
  end
end

class Hash
  include CoreExtensions::Hash
end


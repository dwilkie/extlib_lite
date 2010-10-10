class Hash

  # Convert all keys to strings and deeply converts all values to strings
  # Useful for creating a query string
  #
  # @example
  #   {
  #     :number => 1
  #     :time => {
  #       :actual_time => 2010-10-09 11:49:59 UTC
  #     }
  #   }.stringify #=>
  #   {
  #     "number" => "1",
  #     "time" => {
  #       "actual_time" => "2010-10-09 11:49:59 UTC"
  #     }
  #   }
  #
  def stringify
    stringified_hash = {}
    each do |key, value|
      value.is_a?(Hash) ?
        stringified_hash[key.to_s] = value.stringify :
        stringified_hash[key.to_s] = value.to_s
    end
    stringified_hash
  end
end


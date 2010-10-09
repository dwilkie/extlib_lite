class String
  def singular
    Extlib::Inflection.singular(self)
  end
  alias_method(:singularize, :singular)

  def plural
    Extlib::Inflection.plural(self)
  end
  alias_method(:pluralize, :plural)

  def classify
    Extlib::Inflection.classify(self)
  end

  def constantize
    Extlib::Inflection.constantize(self)
  end

  def underscore
    Extlib::Inflection.underscore(self)
  end

  def to_const_path
    snake_case.gsub(/::/, "/")
  end

  private
    def snake_case
      return downcase if match(/\A[A-Z]+\z/)
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z])([A-Z])/, '\1_\2').
      downcase
    end
end


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
end


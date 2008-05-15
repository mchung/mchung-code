class Hash
  def method_missing(lookup, *args)
    str_key = lookup.to_s
    if str_key[-1,1] == '?'
      query = true
      str_key = str_key[0..str_key.size-2]
    end
    # 1. If it's a query (i.e. foo.bar?), always return a Hash
    # 2. Lookup via the Symbol, then the String
    sym_key = str_key.to_sym
    if query
      rv = self.fetch(sym_key, self.fetch(str_key, {}))
      rv = {} unless rv.kind_of?(Hash)
      rv
    else
      rv = self.fetch(sym_key, self.fetch(str_key, nil))
      rv
    end
  end
end

module Arges
  class ArgesStruct < Struct
    def self.new_from_h(hash)
      extra = (hash.keys - members)
      raise "#{name}: Extra arguments: #{extra}" unless extra.empty?
      new(*hash.values_at(*members))
    end
  end
end

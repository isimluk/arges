module Arges
  Transaction = ArgesStruct.new(
    :items,
    :date,
    :'account name',
    :description,
    :category,
    :type,
    :reconcile,
    :action,
    :'to with sym',
    :'to num.'
  ) do
    def initialize(*)
      super
      self.items ||= []
    end
  end

  TransactionItem = ArgesStruct.new(
    :category,
    :type,
    :reconcile,
    :action,
    :'to with sym',
    :'to num.',
    :'to rate/price',
    :'from with sym',
    :'from num.',
    :'from rate/price',
    :memo
  ) do
  end
end

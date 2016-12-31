require __dir__ + '/arges_struct.rb'

module Arges
  Account = ArgesStruct.new(
    :type,
    :full_name,
    :name,
    :code,
    :description,
    :color,
    :notes,
    :commoditym,
    :commodityn,
    :hidden,
    :tax,
    :place_holder
  ) do
  end
end

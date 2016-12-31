require 'csv'
module Arges
  class InputData
    TRANSACTION_FILE = 'asset-transactions.csv'.freeze

    def self.transactions
      transactions = []
      each_ledger_row do |row|
        if !row.key?(:date)
          sub = Arges::TransactionItem.new_from_h(row)
          transactions.last.items.push(sub)
        else
          transactions.push(Arges::Transaction.new_from_h(row))
        end
      end
      transactions
    end

    def self.each_ledger_row
      File.open(TRANSACTION_FILE) do |f|
        CSV.foreach(f, headers: true) do |row|
          sane_hash = row.to_h.each_with_object({}) do |(key, value), res|
            next if value.empty?
            res[key.downcase.to_sym] = value
          end
          yield(sane_hash)
        end
      end
    end
  end
end

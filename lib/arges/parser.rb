require 'csv'
module Arges
  class InputData
    TRANSACTION_FILE = 'asset-transactions.csv'.freeze
    ACCOUNTS_FILE = 'export-accounts.csv'.freeze

    def self.accounts
      accounts = []
      each_account do |acc|
        accounts.push(Account.new_from_h(acc))
      end
      accounts
    end

    def self.each_account
      File.open(ACCOUNTS_FILE) do |f|
        CSV.foreach(f, headers: true) do |account|
          yield(sanitize(account.to_h))
        end
      end
    end

    def self.transactions
      transactions = []
      each_ledger_row do |row|
        if !row.key?(:date)
          sub = TransactionItem.new_from_h(row)
          transactions.last.items.push(sub)
        else
          transactions.push(Transaction.new_from_h(row))
        end
      end
      transactions
    end

    def self.each_ledger_row
      File.open(TRANSACTION_FILE) do |f|
        CSV.foreach(f, headers: true) do |row|
          yield(sanitize(row.to_h))
        end
      end
    end

    def self.sanitize(hash)
      hash.each_with_object({}) do |(key, value), res|
        next if value.empty?
        res[key.downcase.to_sym] = value
      end
    end
  end
end

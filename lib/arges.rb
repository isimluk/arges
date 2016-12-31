Dir[__dir__ + '/arges/*.rb'].each { |file| require file }

module Arges
  Transactions = InputData.transactions
  Accounts = InputData.accounts
end

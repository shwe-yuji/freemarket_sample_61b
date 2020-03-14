class ChangeTransactionsToTransactionRecords < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :transaction_records
  end
end

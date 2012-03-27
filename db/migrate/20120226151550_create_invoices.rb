class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :sender
      t.references :recipient

      t.timestamps
    end
  end
end

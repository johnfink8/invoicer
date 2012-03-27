class AddInvoiceidToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :invoiceid, :integer

  end
end

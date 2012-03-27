class ChangeInvoiceNotNull < ActiveRecord::Migration
  def up
    change_column :invoices, :recipient_id, :integer, :null => false
    change_column :invoices, :sender_id, :integer, :null => false
  end
  
  def down
    change_column :invoices, :recipient_id, :integer, :null => true
    change_column :invoices, :sender_id, :integer, :null => true
  end

end

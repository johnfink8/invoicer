class Invoice < ActiveRecord::Base
    belongs_to :sender, :class_name => "Contact"
    belongs_to :recipient, :class_name => "Contact"
    has_many :line_items, :class_name => "LineItem"
    accepts_nested_attributes_for :line_items, :allow_destroy => true
    belongs_to :user
    
    before_save do
        if invoiceid.nil? then
            begin
                self.invoiceid=Invoice.order("invoiceid DESC").where('recipient_id=?',recipient_id)[0].invoiceid + 1
            rescue
                self.invoiceid=1
            end
        end
    end
end

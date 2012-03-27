class LineItem < ActiveRecord::Base
    belongs_to :invoice
    belongs_to :description, :class_name => "LineDescription"
end

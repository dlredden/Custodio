class DiagramTable < ActiveRecord::Base
	belongs_to :diagram
	belongs_to :table
end
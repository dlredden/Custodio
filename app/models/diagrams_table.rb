class DiagramsTable < ActiveRecord::Base
	belongs_to :diagrams
	belongs_to :tables
end
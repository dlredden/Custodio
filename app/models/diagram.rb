class Diagram < ActiveRecord::Base
	has_and_belongs_to_many :tables, through: :diagram_tables
end
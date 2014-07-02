class Diagram < ActiveRecord::Base
	has_many :diagram_tables
	has_many :tables, through: :diagram_tables
	belongs_to :company

	accepts_nested_attributes_for :diagram_tables

	attr_accessor :active

	def active
		@active || false
	end
end
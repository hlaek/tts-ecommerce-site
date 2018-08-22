class LineItem < ApplicationRecord
	belongs_to :product
	belongs_to :order, optional: true

	validates :quantity, :numericality => { greater_than: 0,  :message => "Please choose a number between 1 - 100." }
end

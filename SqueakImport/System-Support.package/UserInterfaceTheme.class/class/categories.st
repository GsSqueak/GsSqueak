tools
categories
	"self categories"
	
	^ Set new in: [:result |
		self allThemePropertiesDo: [:cls :prop | result add: prop second].
		result]
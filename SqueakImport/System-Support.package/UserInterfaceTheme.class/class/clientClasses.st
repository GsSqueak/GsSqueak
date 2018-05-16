private
clientClasses

	^ IdentitySet new in: [:result |
		self allThemePropertiesDo: [:cls :prop | result add: cls].
		result]
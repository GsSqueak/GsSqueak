file reader services
servicesWithSuffixes

	^ (((self class selectors copyWithout: #services)
		select: [:symbol | symbol beginsWith: #service])
		reject: [:symbol | symbol endsWith: #Suffixes])
		collect: [:selector | 
			(self perform: (selector, #Suffixes) asSymbol) -> (self perform: selector)]
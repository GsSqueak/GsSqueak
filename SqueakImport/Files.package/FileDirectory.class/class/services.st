file reader services
services

	^ (self class selectors copyWithout: #services)
		select: [:symbol | symbol beginsWith: #service]
		thenCollect: [:selector | self perform: selector]
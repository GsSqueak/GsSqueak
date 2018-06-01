file reader services
services

	^ (((self class selectors copyWithout: #services)
		select: [:symbol | symbol beginsWith: #service])
		reject: [:symbol | symbol endsWith: #Suffixes])
		collect: [:selector | self perform: selector]
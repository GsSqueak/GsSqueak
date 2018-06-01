private testing
response: response indicatesEndOf: aLine

	^ response size > 3 
		and: [(response copyFrom: 1 to: 3) = (aLine copyFrom: 1 to: 3) 
		and: [(response at: 4) = Character space]]
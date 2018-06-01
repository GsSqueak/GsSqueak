comparing
= other 
	^ (other class == self class) 
		and: [other info = self info]
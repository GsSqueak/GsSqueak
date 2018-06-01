private
postOpen

	directory ifNotNil: [
		self changed: #(openPath) , directory pathParts. 
	].

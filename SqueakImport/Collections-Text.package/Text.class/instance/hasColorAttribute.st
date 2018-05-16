testing
hasColorAttribute

	^ self runs anySatisfy: [:attrs | attrs anySatisfy: [:attr |
			attr respondsTo: #color]]
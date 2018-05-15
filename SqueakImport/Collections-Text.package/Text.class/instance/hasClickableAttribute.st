testing
hasClickableAttribute

	^ self runs anySatisfy: [:attrs | attrs anySatisfy: [:attr |
			attr respondsTo: #mayActOnClick]]
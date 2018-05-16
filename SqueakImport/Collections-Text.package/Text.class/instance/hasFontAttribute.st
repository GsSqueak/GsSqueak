testing
hasFontAttribute

	^ self runs anySatisfy: [:attrs | attrs anySatisfy: [:attr |
			(attr respondsTo: #fontNumber) or: [attr respondsTo: #font]]]
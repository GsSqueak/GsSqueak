conversions
asHTMLColor

	^ super asHTMLColor 
		, (Character digitValue: ((alpha bitShift: -4) bitAnd: 15))
		, (Character digitValue: (alpha bitAnd: 15))
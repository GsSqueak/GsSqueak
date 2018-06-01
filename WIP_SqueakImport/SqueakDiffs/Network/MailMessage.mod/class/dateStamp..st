utilities
dateStamp: aDateAndTime
	"Return the given date and time formatted as a email Date: line"
	"The result conforms to RFC822 with a long year, e.g.  'Thu, 18 Feb 1999 20:38:51'"
	| d t |
	d := aDateAndTime asDate.
	t := aDateAndTime asTime.
	^	(d weekday copyFrom: 1 to: 3), ', ',
		(d printFormat: #(1 2 3 $  2 1 1)), ' ',
		"We are careful to avoid fractional seconds appearing in the result:"
		(Time fromSeconds: t asSeconds) print24
examples
example4
	"Example 4 caption below, labels above, ticks point up"
	^ (self new
		start: 100000
		stop: 300000
		minorTick: 5000
		minorTickLength: 2
		majorTick: 50000
		majorTickLength: 10
		caption: 'Example 4'
		tickPrintBlock: [:v | '$' , v printString]
		labelsAbove: true
		captionAbove: false;
		color: Color lightOrange;
		width: 300) openInWorld
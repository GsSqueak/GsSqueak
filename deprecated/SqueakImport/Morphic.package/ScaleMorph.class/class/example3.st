examples
example3
	"Example 3 caption above, labels below, ticks point down"
	^ (self new
		start: -23
		stop: 47
		minorTick: 1
		minorTickLength: 2
		majorTick: 10
		majorTickLength: -10
		caption: 'Example 3'
		tickPrintBlock: [:v | v printString]
		labelsAbove: false
		captionAbove: true;
		color: Color lightBlue;
		width: 300) openInWorld
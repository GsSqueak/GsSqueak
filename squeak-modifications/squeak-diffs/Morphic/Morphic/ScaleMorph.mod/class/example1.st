examples
example1
	"Example 1 captions and labels above, ticks point up"
	^ (self new
		start: 0
		stop: 150
		minorTick: 1
		minorTickLength: 2
		majorTick: 10
		majorTickLength: 10
		caption: 'Example 1'
		tickPrintBlock: [:v | v printString];
		width: 300) openInWorld
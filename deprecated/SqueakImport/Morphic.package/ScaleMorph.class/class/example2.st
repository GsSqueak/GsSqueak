examples
example2
	"Example 2 captions and labels above, ticks point down"
	^ (self new
		start: 0
		stop: 150
		minorTick: 1
		minorTickLength: 2
		majorTick: 10
		majorTickLength: -10
		caption: 'Example 2'
		tickPrintBlock: [:v | v printString];
		width: 300) openInWorld
construction
addLine
	"Append a line to the menu after the last entry. Suppress duplicate lines."

	(lastDivider ~= selections size) ifTrue: [
		lastDivider := selections size.
		dividers addLast: lastDivider].
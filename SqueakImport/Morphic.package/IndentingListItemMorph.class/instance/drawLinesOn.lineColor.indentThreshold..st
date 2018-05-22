drawing
drawLinesOn: aCanvas lineColor: lineColor indentThreshold: aNumber
	self indentLevel > aNumber ifTrue: [
		| hasToggle |
		hasToggle := self hasToggle.
		"Draw line from toggle to text"
		self drawLineToggleToTextOn: aCanvas lineColor: lineColor hasToggle: hasToggle.

		"Draw the line from my toggle to the nextSibling's toggle"
		self nextVisibleSibling ifNotNil: [ self drawLinesToNextSiblingOn: aCanvas lineColor: lineColor hasToggle: hasToggle ]].

	"If I have children and am expanded, draw a line to my first child"
	((self firstVisibleChild notNil
		and: [self isExpanded])
		and: [self firstVisibleChild indentLevel > aNumber])
			ifTrue: [ self drawLinesToFirstChildOn: aCanvas lineColor: lineColor ]
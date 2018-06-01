geometry
charactersOccluded
	"Let the receiver suggest to its neighboring vertical Splitter(s) that
	they try to optimize their position such that none of the receivers
	visible lines need to wrap."
	| _gsSqueakTemp_numberOfPhysicalLines _gsSqueakTemp_lastPhysicalLine _gsSqueakTemp_logicalLines _gsSqueakTemp_physicalLines |
	_gsSqueakTemp_numberOfPhysicalLines := 0.
	_gsSqueakTemp_lastPhysicalLine := (_gsSqueakTemp_physicalLines := textMorph paragraph lines)
				detect: [:each | 
					_gsSqueakTemp_numberOfPhysicalLines := _gsSqueakTemp_numberOfPhysicalLines + 1.
					each bottom > self height]
				ifNone: [_gsSqueakTemp_physicalLines last].
	_gsSqueakTemp_logicalLines := (self text copyFrom: 1 to: _gsSqueakTemp_lastPhysicalLine last) lineCount.
	^ _gsSqueakTemp_numberOfPhysicalLines - _gsSqueakTemp_logicalLines
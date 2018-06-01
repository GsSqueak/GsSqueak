as yet unclassified
composeEachRectangleIn: rectangles 
	| _gsSqueakTemp_myLine _gsSqueakTemp_lastChar |
	1
		to: rectangles size
		do: [:i | 
			currCharIndex <= theText size
				ifFalse: [^ false].
			_gsSqueakTemp_myLine := scanner
						composeFrom: currCharIndex
						inRectangle: (rectangles at: i)
						firstLine: isFirstLine
						leftSide: i = 1
						rightSide: i = rectangles size.
			lines addLast: _gsSqueakTemp_myLine.
			actualHeight := actualHeight max: _gsSqueakTemp_myLine lineHeight.
			"includes font changes"
			currCharIndex := _gsSqueakTemp_myLine last + 1.
			_gsSqueakTemp_lastChar := theText at: _gsSqueakTemp_myLine last.
			(CharacterSet crlf includes: _gsSqueakTemp_lastChar)
				ifTrue: [^ #cr].
			wantsColumnBreaks
				ifTrue: [_gsSqueakTemp_lastChar = Character characterForColumnBreak
						ifTrue: [^ #columnBreak]]].
	^ false
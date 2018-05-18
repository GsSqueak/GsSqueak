private
composeEachRectangleIn: rectangles

	| myLine lastChar |

	1 to: rectangles size do: [:i | 
		currCharIndex <= theText size ifFalse: [^false].
		myLine := scanner 
			composeFrom: currCharIndex 
			inRectangle: (rectangles at: i)				
			firstLine: isFirstLine 
			leftSide: i=1 
			rightSide: i=rectangles size.
		lines addLast: myLine.
		actualHeight := actualHeight max: myLine lineHeight.  "includes font changes"
		currCharIndex := myLine last + 1.
		lastChar := theText at: myLine last.
		(CharacterSet crlf includes: lastChar) ifTrue: [^#cr].
		wantsColumnBreaks ifTrue: [
			lastChar = Character characterForColumnBreak ifTrue: [^#columnBreak].
		].
	].
	^false
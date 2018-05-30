displaying
displayLine: line offset: baseOffset leftInRun: leftInRun
	| offset aText string doJustified |

	self setTextStylesForOffset: ((line first) + 1).	" sets up various instance vars from text styles "
	offset := baseOffset.
	offset := offset + (line left @ (line top + line baseline - self font ascent )). 
	offset := offset + ((self textStyle alignment caseOf:{
		[Centered] -> [ line paddingWidth /2 ].
		[RightFlush] -> [ line paddingWidth ] } otherwise:[0]) @ 0).

	canvas moveto: offset.

	aText := paragraph text copyFrom: line first to: line last.
	doJustified := (paragraph textStyle alignment = Justified)
						and: [ (paragraph text at:line last) ~= Character cr
						and: [aText runs runs size = 1]].
	string := aText string.
	aText runs withStartStopAndValueDo: [:start :stop :attributes | | s drawFont |
		self setTextStylesForOffset: (start + line first - 1).	" sets up inst vars from text styles "
		s := string copyFrom: start to: stop.
		drawFont := self font.
		canvas setFont: drawFont.
		canvas 
			textStyled: s
			at: offset 		"<--now ignored"
			font: drawFont 		"<--now ignored"
			color: foregroundColor
			justified: doJustified		"<-can't do this now for multi-styles" 
			parwidth: line right - line left.
	].

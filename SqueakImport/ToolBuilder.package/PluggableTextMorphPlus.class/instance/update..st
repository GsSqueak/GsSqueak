updating
update: what
	what ifNil:[^self].
	what == getColorSelector ifTrue: [self color: (model perform: getColorSelector)].
	what == getTextColorSelector ifTrue: [self setTextColor: (model perform: getTextColorSelector)].
	what == #style ifTrue: [self updateStyle].
	
	
	^super update: what
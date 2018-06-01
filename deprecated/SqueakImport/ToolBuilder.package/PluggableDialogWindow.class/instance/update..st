updating
update: what

	what ifNil:[^self].

	what == self getTitleSelector ifTrue:[self title: (model perform: self getTitleSelector)].
	what == self getMessageSelector ifTrue:[self message: (model perform: self getMessageSelector)].
	
	what == self getChildrenSelector ifTrue:[
		self paneMorph removeAllMorphs.
		(self model perform: self getChildrenSelector)
			do: [:m| m hResizing: #spaceFill; vResizing: #spaceFill];
			in: [:children | self paneMorph addAllMorphs: children]].

	what == self getButtonsSelector ifTrue:[
		self buttonRow
			removeAllMorphs;
			addAllMorphs: (self model perform: self getButtonsSelector).
		self updateButtonProperties].
	
	what == #close ifTrue: [^ self delete].

	super update: what.
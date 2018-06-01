drawing
colorToUse

	^ (self valueOfProperty: #wasRefreshed ifAbsent: [false])
		ifTrue: [complexContents highlightColor ifNil: [self highlightTextColor]]
		ifFalse: [
			self isSelected ifTrue: [^ self selectionTextColor].			
			complexContents preferredColor ifNil: [self color]]
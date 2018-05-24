drawing
drawOn: aCanvas 
	"Draw the hand itself (i.e., the cursor)."

	| userPic |
	temporaryCursor isNil 
		ifTrue: [aCanvas paintImage: NormalCursor at: bounds topLeft]
		ifFalse: [aCanvas paintImage: temporaryCursor at: bounds topLeft].
	self hasUserInformation 
		ifTrue: 
			[aCanvas 
				drawString: userInitials
				at: self cursorBounds topRight + (0 @ 4)
				font: nil
				color: color.
			(userPic := self userPicture) ifNotNil: 
					[aCanvas paintImage: userPic at: self cursorBounds topRight + (0 @ 24)]]
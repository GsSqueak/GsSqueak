drawing
drawOn: aCanvas 
	"Draw the hand itself (i.e., the cursor)."
	temporaryCursor isNil
		ifTrue: [aCanvas paintImage: NormalCursor at: bounds topLeft]
		ifFalse: [aCanvas paintImage: temporaryCursor at: bounds topLeft].
	self hasUserInformation
		ifTrue: [aCanvas
				drawString: userInitials
				at: self cursorBounds topRight + (0 @ 4)
				font: nil
				color: color.
			self userPicture
				ifNotNil: [:_gsSqueakTemp_userPic | aCanvas paintImage: _gsSqueakTemp_userPic at: self cursorBounds topRight + (0 @ 24)]]
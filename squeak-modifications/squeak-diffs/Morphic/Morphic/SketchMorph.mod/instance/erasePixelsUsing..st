menu
erasePixelsUsing: evt 
	"Let the user specifiy a color such that all pixels of that color should be erased; then do the erasure"
	self
		changeColorTarget: self
		selector: #rememberedColor:
		originalColor: nil
		hand: evt hand.
	self rememberedColor "color to erase"
		ifNil: [ ^ self ]
		ifNotNilDo:
			[ : chosenColor | self erasePixelsOfColor: chosenColor ]
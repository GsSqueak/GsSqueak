updating
updateMenuButtonImage
	"update the receiver's menuButton. put a new image inside"
	self menuButton removeAllMorphs.
	self menuButton
		addMorphCentered: (ImageMorph new image: self menuImage)
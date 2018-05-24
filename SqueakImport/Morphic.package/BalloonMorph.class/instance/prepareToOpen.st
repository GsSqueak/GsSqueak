private
prepareToOpen
	"Override the color if not already set."
	self userInterfaceTheme color ifNotNil: [ : col | self color: col].
	self
		lock ;
		fullBounds ;
		setProperty: #morphicLayerNumber
		toValue: self morphicLayerNumber
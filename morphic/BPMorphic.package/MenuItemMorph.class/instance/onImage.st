private
onImage
	"Return the form to be used for indicating an '<on>' marker"
	^ MenuIcons
		checkBoxOnColorized: (self userInterfaceTheme textColor
				ifNil: [Color black])
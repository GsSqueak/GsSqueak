private
offImage
	"Return the form to be used for indicating an '<off>' marker"
	^ MenuIcons
		checkBoxOffColorized: (self userInterfaceTheme textColor
				ifNil: [Color black])
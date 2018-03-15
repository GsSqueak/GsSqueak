defaults
defaultSubMenuMarker
	^ MenuIcons
		subMenuMarkerColorized: ((UserInterfaceTheme current get: #textColor for: self)
				ifNil: [Color black])
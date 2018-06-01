accessing - icons
subMenuMarkerColorized: aColor

	^ self subMenuMarker
		collectColors: [:c | aColor alpha: c alpha]
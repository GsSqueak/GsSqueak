preferences
useLargeColorPicker: aBoolean 
	UseLargeColorPicker = aBoolean
		ifFalse: [ColorChart := nil.
			ImageLibrary
				ifNotNil: [ImageLibrary
						removeKey: #colorMemoryImage
						ifAbsent: [];
						
						removeKey: #colorMemoryThinImage
						ifAbsent: []]].
	UseLargeColorPicker := aBoolean
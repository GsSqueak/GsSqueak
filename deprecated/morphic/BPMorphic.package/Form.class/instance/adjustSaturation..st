converting
adjustSaturation: saturation 
	^ self
		collectColors: [:color | color adjustSaturation: saturation brightness: 0]
converting
adjustBrightness: brightness 	^ self		collectColors: [:color | color adjustSaturation: 0 brightness: brightness]
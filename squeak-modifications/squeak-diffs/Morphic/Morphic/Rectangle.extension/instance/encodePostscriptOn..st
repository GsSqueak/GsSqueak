*Morphic-MorphicExtras-*morphic-Postscript Canvases
encodePostscriptOn:aStream 
	aStream write:self origin; print:' '; write:self extent; print:' '.
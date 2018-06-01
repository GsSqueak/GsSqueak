accessing
pixelScale
	"Answer the scale factor to convert from the truetype's units into the receiver's pixel size. The scale for a font is computed by *excluding* the linegap (leading) in the font. Consequently, the height of the font (including linegap/leading) will be larger than the pixel size."
	^self pixelSize asFloat / 
		(ttcDescription typographicAscender - 
			ttcDescription typographicLineGap - 
			ttcDescription typographicDescender)
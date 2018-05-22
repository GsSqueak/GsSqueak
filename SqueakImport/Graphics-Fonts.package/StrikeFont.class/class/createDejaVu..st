font creation
createDejaVu: pointSize
	"Warning: Uses the methods in 'dejaVu font data' category, that will be removed soon (or are already removed) to save space."
	
	| base bold oblique boldOblique point |
	point := pointSize asString.
	base := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansBook', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBook', point, 'Data') asSymbol)
		name: 'Bitmap DejaVu Sans ', point)
			pointSize: pointSize.
	bold := (StrikeFont new
		buildFromForm:  (self perform: ('dejaVuSansBold', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBold', point, 'Data') asSymbol)
		name: 'Bitmap DejaVu Sans ', point, 'B')
			emphasis: 1;
			pointSize: pointSize.
	oblique := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansOblique', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansOblique', point, 'Data') asSymbol)
		name: 'Bitmap DejaVu Sans ', point, 'I')
			emphasis: 2;
			pointSize: pointSize.
	boldOblique := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansBoldOblique', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBoldOblique', point, 'Data') asSymbol)
		name: 'Bitmap DejaVu Sans ', point, 'BI')
			emphasis: 3;
			pointSize: pointSize.
		
	base derivativeFont: bold at: 1.
	base derivativeFont: oblique at: 2.
	base derivativeFont: boldOblique at: 3.
	
	^base
font creation
createDejaVuDark: pointSize
	
	| base bold oblique boldOblique point |
	point := pointSize asString.
	base := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansBookDark', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBookDark', point, 'Data') asSymbol)
		name: 'Darkmap DejaVu Sans', point)
			pointSize: pointSize.
	bold := (StrikeFont new
		buildFromForm:  (self perform: ('dejaVuSansBoldDark', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBoldDark', point, 'Data') asSymbol)
		name: 'Darkmap DejaVu Sans', point, 'B')
			emphasis: 1;
			pointSize: pointSize.
	oblique := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansObliqueDark', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansObliqueDark', point, 'Data') asSymbol)
		name: 'Darkmap DejaVu Sans', point, 'I')
			emphasis: 2;
			pointSize: pointSize.
	boldOblique := (StrikeFont new
		buildFromForm: (self perform: ('dejaVuSansBoldObliqueDark', point, 'Form') asSymbol)
		data: (self perform: ('dejaVuSansBoldObliqueDark', point, 'Data') asSymbol)
		name: 'Darkmap DejaVu Sans', point, 'BI')
			emphasis: 3;
			pointSize: pointSize.
		
	base derivativeFont: bold at: 1.
	base derivativeFont: oblique at: 2.
	base derivativeFont: boldOblique at: 3.
	
	^base
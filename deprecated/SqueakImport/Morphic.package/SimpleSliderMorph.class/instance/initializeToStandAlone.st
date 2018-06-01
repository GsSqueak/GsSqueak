parts bin
initializeToStandAlone
	| nominalColor |

	self initialize.
	self beSticky.
	self extent: 14@120.
	nominalColor := Color r: 0.452 g: 0.645 b: 0.935.
	self color: nominalColor.
	self borderColor: Color veryDarkGray.
	self sliderColor: nominalColor muchLighter.
	self descending: true.
	self setScaledValue: 0.3
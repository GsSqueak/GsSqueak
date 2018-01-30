color mapping
rgbaBitMasks
	"Return the masks for specifying the R,G,B, and A components in the
	receiver "
	self depth <= 8
		ifTrue: [^ #(16711680 65280 255 4278190080 )].
	self depth = 16
		ifTrue: [^ #(31744 992 31 0 )].
	self depth = 32
		ifTrue: [^ #(16711680 65280 255 4278190080 )].
	self error: 'Bad depth for form'
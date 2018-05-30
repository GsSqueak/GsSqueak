multibyte character methods
fixAccuISO8859From: aStrikeFont

	| f |
	self reset.
	xTable := aStrikeFont xTable copy.
	glyphs := Form extent: aStrikeFont glyphs extent.
	maxAscii := 255.
	minAscii := 0.
	"stopConditions := nil."

	0 to: 127 do: [:i |
		f := aStrikeFont characterFormAt: (Character value: i) isoToSqueak.
		f width  = 0 ifTrue: [f := Form extent: 1@f height].
		
		self characterFormAt: (Character value: i) put: f.
	].
	128 to: 159 do: [:i |
		f := Form extent: 1@f height.
		self characterFormAt: (Character value: i) put: f.
	].
	160 to: 255 do: [:i |
		f := aStrikeFont characterFormAt: (Character value: i) isoToSqueak.
		f width  = 0 ifTrue: [f := Form extent: 1@f height].
		
		self characterFormAt: (Character value: i) put: f.
	].
		
	^ self.	

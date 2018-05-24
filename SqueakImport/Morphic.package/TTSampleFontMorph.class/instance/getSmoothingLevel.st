menu
getSmoothingLevel
	"Menu support"
	smoothing = 1
		ifTrue: [^ 'turn on smoothing' translated].
	smoothing = 2
		ifTrue: [^ 'more smoothing' translated].
	smoothing = 4
		ifTrue: [^ 'turn off smoothing' translated]
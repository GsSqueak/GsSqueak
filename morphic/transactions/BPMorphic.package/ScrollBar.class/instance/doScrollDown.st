scrolling
doScrollDown
	"Scroll automatically while mouse is down"
	(self waitForDelay1: 200 delay2: 40)
		ifFalse: [^ self].
	self setValue: value + scrollDelta
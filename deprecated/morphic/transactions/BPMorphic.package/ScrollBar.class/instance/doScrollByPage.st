scrolling
doScrollByPage
	"Scroll automatically while mouse is down"
	(self waitForDelay1: 300 delay2: 100)
		ifFalse: [^ self].
	nextPageDirection
		ifTrue: [self setValue: value + pageDelta]
		ifFalse: [self setValue: value - pageDelta]
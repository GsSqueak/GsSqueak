initialization
addCloseBox
	"If I have a labelArea, add a close box to it"

	labelArea ifNil: [^ self].
	mustNotClose == true ifTrue: [^ self].
	closeBox ifNotNil: [closeBox delete].
	closeBox := self createCloseBox.
	closeBox layoutFrame: self class closeBoxFrame.
	labelArea addMorphFront: closeBox
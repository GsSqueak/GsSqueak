initialization
addExpandBox
	"If I have a labelArea, add a close box to it"
	
	labelArea ifNil: [^ self].
	self class hideExpandButton ifTrue: [^ self].
	expandBox ifNotNil: [expandBox delete].
	expandBox := self createExpandBox.
	expandBox layoutFrame: self class expandBoxFrame.
	labelArea addMorphBack: expandBox
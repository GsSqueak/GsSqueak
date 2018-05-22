accessing
flapTab
	"Answer the tab affilitated with the receiver.  Normally every flap tab is expected to have a PasteUpMorph which serves as its 'referent.'"

	| ww |
	self isFlap ifFalse:[^nil].
	ww := self presenter associatedMorph ifNil: [ActiveWorld].
	^ ww ifNotNil: [ww flapTabs detect:[:any| any referent == self] ifNone: [nil]]
positioning
fitOnScreen
	"19 sept 2000 - allow flaps in any paste up"
	| constrainer t l |
	constrainer := (owner ifNil: [self]) clearArea.
	self flapShowing "otherwise no point in doing this"
		ifTrue:[self spanWorld].
	self orientation == #vertical ifTrue: [
		t := ((self top min: (constrainer bottom- self height)) max: constrainer top).
		t = self top ifFalse: [self top: t].
	] ifFalse: [
		l := ((self left min: (constrainer right - self width)) max: constrainer left).
		l = self left ifFalse: [self left: l].
	].
	self flapShowing ifFalse: [self positionObject: self atEdgeOf: constrainer].

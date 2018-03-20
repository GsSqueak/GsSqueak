initialization
adaptToWorld
	| _gsSqueakTemp_wasShowing _gsSqueakTemp_new |
	(_gsSqueakTemp_wasShowing := self flapShowing)
		ifTrue: [self hideFlap].
	(self respondsTo: #unhibernate)
		ifTrue: [(_gsSqueakTemp_new := self unhibernate) == self
				ifFalse: [^ _gsSqueakTemp_new adaptToWorld]].
	_gsSqueakTemp_wasShowing
		ifTrue: [self spanWorld.
			self positionObject: self.
			self showFlap]
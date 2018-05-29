initialization
adaptToWorld
	| wasShowing new |
	(wasShowing := self flapShowing) ifTrue:
					[self hideFlap].
	(self respondsTo: #unhibernate) ifTrue: [
		(new := self unhibernate) == self ifFalse: [
			^ new adaptToWorld]].
	wasShowing ifTrue:
		[self spanWorld.
		self positionObject: self.
		self showFlap]
open/close
delete
	| thisWorld sketchEditor aPaintBox |
	self mustNotClose ifTrue: [^self].
	model okToClose ifFalse: [^self].
	thisWorld := self world.
	sketchEditor := self extantSketchEditor.
	
	self activeHand removeKeyboardListener: self.
	
	self isFlexed
		ifTrue: [owner delete]
		ifFalse: [super delete].
	model windowIsClosing; release.
	model := nil.
	sketchEditor ifNotNil:
		[sketchEditor deleteSelfAndSubordinates.
		 (thisWorld notNil 
		  and: [(aPaintBox := thisWorld paintBoxOrNil) notNil]) ifTrue:
			[aPaintBox delete]].
		
	SystemWindow noteTopWindowIn: thisWorld
dropping/grabbing
justDroppedInto: aMorph event: anEvent
	"This message is sent to a dropped morph after it has been dropped on -- and been accepted by -- a drop-sensitive morph"

	| partsBinCase cmd |
	(self formerOwner notNil and: [self formerOwner ~~ aMorph])
		ifTrue: [self removeHalo].
	self formerOwner: nil.
	self formerPosition: nil.
	cmd := self valueOfProperty: #undoGrabCommand.
	cmd ifNotNil:[aMorph rememberCommand: cmd.
				self removeProperty: #undoGrabCommand].
	(partsBinCase := aMorph isPartsBin) ifFalse:
		[self isPartsDonor: false].
	(self isInWorld and: [partsBinCase not]) ifTrue:
		[self world startSteppingSubmorphsOf: self].
	"Note an unhappy inefficiency here:  the startStepping... call will often have already been called in the sequence leading up to entry to this method, but unfortunately the isPartsDonor: call often will not have already happened, with the result that the startStepping... call will not have resulted in the startage of the steppage."

	"An object launched by certain parts-launcher mechanisms should end up fully visible..."
	(self hasProperty: #beFullyVisibleAfterDrop) ifTrue:
		[aMorph == ActiveWorld ifTrue:
			[self goHome].
		self removeProperty: #beFullyVisibleAfterDrop].

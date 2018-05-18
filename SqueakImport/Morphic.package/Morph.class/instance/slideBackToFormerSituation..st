dropping/grabbing
slideBackToFormerSituation: evt 
	"A drop of the receiver having been rejected, slide it back to where it came from, if possible."

	| slideForm formerOwner formerPosition aWorld startPoint endPoint trans |
	formerOwner := self formerOwner.
	formerPosition := self formerPosition.
	(aWorld := evt hand world) ifNil: [^ self delete]. "Likely a moribund hand from an EventRecorder playback."

	trans := formerOwner transformFromWorld.
	slideForm := trans isPureTranslation 
				ifTrue: [self imageForm offset: 0 @ 0]
				ifFalse: 
					[((TransformationMorph new asFlexOf: self) transform: trans) imageForm 
						offset: 0 @ 0]. 
	startPoint := evt hand fullBounds origin.
	endPoint := trans localPointToGlobal: formerPosition.
	owner removeMorph: self.
	aWorld displayWorld.
	slideForm 
		slideFrom: startPoint
		to: endPoint
		nSteps: 12
		delay: 15.
	"The OLPC Virtual Screen wouldn't notice the last update here."
	self refreshWorld.
	formerOwner addMorph: self.
	self position: formerPosition.
	self justDroppedInto: formerOwner event: evt
accessing
balloonText
	"Overridden to send selector to model and not self. Do not use
	#perform:orSendTo: because super does more than just the send.."
	self balloonTextSelector
		ifNotNil: [:selector | (self model respondsTo: selector)
				ifTrue: [^ self model perform: selector]].
	^ super balloonText
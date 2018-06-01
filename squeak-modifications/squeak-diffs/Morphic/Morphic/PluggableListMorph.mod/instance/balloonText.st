accessing
balloonText
	"Overridden to send selector to model and not self. Do not use #perform:orSendTo: because super does more than just the send.."
	
	self getHelpSelector ifNotNil: [:selector |
		((self model respondsTo: selector) and: [self hoverRow > 0]) ifTrue: [
			^ self model perform: selector with: (self modelIndexFor: self hoverRow)]].
	
	^ super balloonText
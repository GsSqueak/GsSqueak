utilities
maybeSignalDeprecationFor: context message: messageString explanation: explanationString
	self showDeprecationWarnings ifTrue:
		[ | message |
		message := context method reference, ' has been deprecated', messageString, '.'.
		explanationString ifNotEmpty: [message := message, ' ', explanationString].
		self signal: message].
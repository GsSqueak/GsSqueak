private
pvtCheckForPvtSelector: encoder 
	"If the code being compiled is trying to send a private message (e.g.
	'pvtCheckForPvtSelector:') to anyone other than self, then complain to
	encoder."
	selector isPvtSelector
		ifTrue: [receiver isSelfPseudoVariable
				ifFalse: [encoder notify: 'Private messages may only be sent to self']]
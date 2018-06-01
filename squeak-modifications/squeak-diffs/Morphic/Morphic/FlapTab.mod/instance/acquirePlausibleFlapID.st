access
acquirePlausibleFlapID
	"Give the receiver a flapID that is globally unique; try to hit the mark vis a vis the standard system flap id's, for the case when this method is invoked as part of the one-time transition"

	| wording |
	wording := self wording.
	(wording isEmpty or: [wording = '---']) ifTrue: [wording := 'Flap' translated].
	
	^ self provideDefaultFlapIDBasedOn: wording
private-writing
openStreamWhile: aBlock 
	stream open.
	^ aBlock ensure: [ stream close ]
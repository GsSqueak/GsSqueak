instance creation
newFromNumber: aNumber scale: scaleIn 
	"Answer a new instance of me."
	| temp |
	temp := self basicNew.
	temp setFraction: aNumber asFraction scale: scaleIn.
	^ temp
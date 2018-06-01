construction support
addMorph: aMorph asElementNumber: aNumber inGlobalFlapWithID: anID 
	"If any global flap satisfies flapBlock, add aMorph to it at the given
	position. No senders in the image -- intended to be invoked by doits in
	code updates only, and applies to flaps that are parts bins and that
	like thumbnailing"
	^ self
		addMorph: aMorph
		asElementNumber: aNumber
		inGlobalFlapSatisfying: [:aFlap | aFlap flapID = anID]
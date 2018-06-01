change reporting
invalidRect: damageRect from: aMorph
	"Clip damage reports to my bounds, since drawing is clipped to my bounds."
	self isWorldMorph
		ifTrue: [worldState recordDamagedRect: damageRect].
	^super invalidRect: damageRect from: aMorph
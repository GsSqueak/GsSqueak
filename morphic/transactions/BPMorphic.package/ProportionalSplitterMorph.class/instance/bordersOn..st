controlled morphs
bordersOn: aMorph 
	"Answer true if the aMorph is one of my neighbours."
	^ (leftOrTop includes: aMorph)
		or: [rightOrBottom includes: aMorph]
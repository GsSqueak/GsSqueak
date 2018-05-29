compact
makeFlapCompact: aBool
	"Return true if the referent of the receiver represents a 'compact' flap"
	aBool ifTrue:[
		referent
			layoutPolicy: TableLayout new;
			vResizing: #shrinkWrap;
			useRoundedCorners.
	] ifFalse:[
		referent
			layoutPolicy: nil;
			vResizing: #rigid;
			useSquareCorners.
	].
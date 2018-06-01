accessing
fieldList
	"Answer the base field list plus an abbreviated list of indices."
	| tempNames stackIndices |
	tempNames := object tempNames collect:[:t| '[',t,']'].
	stackIndices := (object numTemps + 1 to: object stackPtr) collect: [:i| i printString].
	^self baseFieldList, tempNames, stackIndices
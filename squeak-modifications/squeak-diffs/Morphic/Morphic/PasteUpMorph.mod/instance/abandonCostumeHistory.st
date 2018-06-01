misc
abandonCostumeHistory
	self allMorphsDo:
		[:m | m player ifNotNil: [m player forgetOtherCostumes]]
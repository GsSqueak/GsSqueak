*Morphic-MorphicExtras-PartsBin
descriptionForPartsBin
	"If the receiver is a member of a class that would like to be represented in a parts bin, answer the name by which it should be known, and a documentation string to be provided, for example, as balloon help.  When the 'nativitySelector' is sent to the 'globalReceiver', it is expected that some kind of Morph will result.  The parameters used in the implementation below are for documentation purposes only!"

	^ DescriptionForPartsBin
		formalName: 'PutFormalNameHere'
		categoryList: #(PutACategoryHere MaybePutAnotherCategoryHere)
		documentation: 'Put the balloon help here'
		globalReceiverSymbol: #PutAGlobalHere
		nativitySelector: #PutASelectorHere
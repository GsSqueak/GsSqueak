world menu
getWorldMenu: aSymbol
	^(TheWorldMenu new
		world: self
		project: (self project ifNil: [Project current])       "mvc??"
		hand: self primaryHand) perform: aSymbol
world menu
buildWorldMenu: evt
	^(TheWorldMenu new
		world: self
		project: (self project ifNil: [Project current])       "mvc??"
		hand: evt hand) buildWorldMenu.
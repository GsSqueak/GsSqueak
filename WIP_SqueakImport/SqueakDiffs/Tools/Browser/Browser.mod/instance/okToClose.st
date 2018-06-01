multi-window support
okToClose
	^super okToClose
	  and: [self multiWindowState isNil or: [self multiWindowState okToClose]]
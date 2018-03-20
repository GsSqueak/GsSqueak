predefined flaps
addNewDefaultSharedFlaps
	"Add the stack tools flap and the navigator flap to the global list, but
	do not have them showing initially. Transitional, called by the
	postscript of the FlapsOnBottom update; probably dispensable
	afterwards. "
	SharedFlapTabs
		ifNotNil: [(self globalFlapTabWithID: 'Stack Tools' translated)
				ifNil: [SharedFlapTabs add: self newStackToolsFlap delete].
			self enableGlobalFlapWithID: 'Stack Tools' translated.
			(self globalFlapTabWithID: 'Navigator' translated)
				ifNil: [SharedFlapTabs add: self newNavigatorFlap delete].
			self enableGlobalFlapWithID: 'Navigator' translated.
			self currentWorld addGlobalFlaps]
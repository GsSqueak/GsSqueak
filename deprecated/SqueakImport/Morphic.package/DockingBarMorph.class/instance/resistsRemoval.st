accessing
resistsRemoval
"Answer whether the receiver is marked as resisting removal"
	^ Preferences noviceMode
		or: [super resistsRemoval]
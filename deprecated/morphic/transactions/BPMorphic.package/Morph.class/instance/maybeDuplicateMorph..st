meta-actions
maybeDuplicateMorph: evt 
	self okayToDuplicate
		ifTrue: [^ self duplicateMorph: evt]
private
maybeDoDup: evt with: dupHandle 
	evt hand obtainHalo: self.
	^ target okayToDuplicate
		ifTrue: [self doDup: evt with: dupHandle]
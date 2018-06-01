utilities
confirm: aString orCancel: cancelBlock at: aPointOrNil
	^self
		confirm: aString
		orCancel: cancelBlock
		title: 'Please Confirm'
		at: aPointOrNil
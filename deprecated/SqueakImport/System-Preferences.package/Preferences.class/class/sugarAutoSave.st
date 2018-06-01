standard queries
sugarAutoSave
	^ self
		valueOfFlag: #sugarAutoSave
		ifAbsent: [false]
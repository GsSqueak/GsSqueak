standard queries
useButtonPropertiesToFire
	^ self
		valueOfFlag: #useButtonProprtiesToFire
		ifAbsent: [ false ]
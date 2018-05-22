printing
printConstructorOn: aStream indent: level

	^ self printConstructorOn: aStream indent: level nodeDict: IdentityDictionary new

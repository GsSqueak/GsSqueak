private
remove: binding from: aDictionary readdAfter: aBlock 
	aDictionary
		removeKey: binding key
		ifAbsent: [^ aBlock value].
	^ aBlock
		ensure: [aDictionary add: binding]
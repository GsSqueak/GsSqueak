loading
loadPropertiesFrom: aDictionary

	aDictionary associationsDo: [:assoc |
		self loadProperty: assoc key value: assoc value].
	self verifyProperties
initialization
refresh

	self contents: self getLabel.
	icon := self getIcon.
	
	(self valueOfProperty: #wasRefreshed ifAbsent: [false]) ifFalse: [
		self setProperty: #wasRefreshed toValue: true].
configuration
loadConfiguration
	| dict |
	dict := self loadJson: 'configuration' from: self fileDirectory.
	self configuration: dict.
	
	"remove comments from initialize order"
	self classesToInitializeFirst
		withIndexDo: [:class :index | class isArray
				ifTrue: [self classesToInitializeFirst at: index put: class first]]
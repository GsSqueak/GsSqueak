configuration
loadConfiguration

	| dict |
	dict := self loadJson: 'configuration' from: self fileDirectory.
	self configuration: dict
loading
loadProperties

	| entry properties |
	entry := self fileDirectory entryAt: 'properties.json' ifAbsent: [
		^ self error: ('Missing properties.json in {1}' format: {self fileDirectory name})].
	entry isDirectory ifTrue: [
		^ self error: ('The properties.json file in {1} was a directory, but has to be a file' format: {self fileDirectory name})].
	properties := MCFileTreeJsonParser parse: entry readStream contents.
	self loadPropertiesFrom: properties
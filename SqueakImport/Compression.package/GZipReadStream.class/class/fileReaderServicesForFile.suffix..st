fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix 
	| services |
	(suffix = 'gz') | (suffix = '*')
		ifFalse: [^ #()].
	services := OrderedCollection new.
	(suffix = '*') | (fullName asLowercase endsWith: '.cs.gz') | (fullName asLowercase endsWith: '.mcs.gz')
		ifTrue: [services add: self serviceFileIn.
			(Smalltalk includesKey: #ChangSet)
				ifTrue: [services add: self serviceFileIntoNewChangeSet]].
	services addAll: self services.
	^ services
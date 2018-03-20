annotation
timeStamp
	"Answer the time stamp for the chosen class and method, if any, else an empty string"

	|  selector  selectedClassOrMetaClass |
	(selector := self selectedMessageName) ifNotNil:
		[(selectedClassOrMetaClass := self selectedClassOrMetaClass)
			ifNil:
				[^ String new]
			ifNotNil:
				[(selectedClassOrMetaClass timeStampForMethod: selector env: self envId) 
					ifNotNil: [:stamp | ^ stamp]]].
	^ String new
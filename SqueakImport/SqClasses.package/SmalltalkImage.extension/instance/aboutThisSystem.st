*SqClasses-*SqClasses-*SqClasses-miscellaneous
aboutThisSystem 
	"Identify software version"

	^self globals
		at: #SystemReporter
		ifPresent: [:sys | sys open]
		ifAbsent: [self inform: self systemInformationString withCRs]

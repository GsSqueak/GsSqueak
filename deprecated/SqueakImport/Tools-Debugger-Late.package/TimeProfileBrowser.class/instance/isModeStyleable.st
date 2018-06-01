contents
isModeStyleable
	"Ensure that only methods are styled."

	^self selectedMessageName notNil and: [ super isModeStyleable ]
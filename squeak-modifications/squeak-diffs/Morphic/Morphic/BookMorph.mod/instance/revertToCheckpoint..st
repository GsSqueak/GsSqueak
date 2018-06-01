scripting
revertToCheckpoint: secsSince1901
	
	"Put all scripts (that appear in MethodPanes) back to the way they were at an earlier time."

	MethodHolders do: [:mh | | cngRecord | 
		cngRecord := mh versions versionFrom: secsSince1901.
		cngRecord ifNotNil: [
			(cngRecord stamp: Utilities changeStamp) fileIn]].
		"does not delete method if no earlier version"


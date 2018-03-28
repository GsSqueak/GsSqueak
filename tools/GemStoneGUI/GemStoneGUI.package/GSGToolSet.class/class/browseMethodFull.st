button pane
browseMethodFull
	"Create and schedule a full Browser and then select the current class and message."
	^ self selectedClassOrMetaClass ifNotNil: [ :cls |
		self selectedMessageName
			ifNotNil: [ :sel |
				GSGToolSet interface: self interface browse: cls selector: sel]
			ifNil: [GSGToolSet interface: self interface browseClass: cls]].
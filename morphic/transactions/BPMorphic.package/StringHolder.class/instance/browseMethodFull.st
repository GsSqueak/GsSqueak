-Tools
browseMethodFull
	"Create and schedule a full Browser and then select the current class
	and message."
	^ self selectedClassOrMetaClass
		ifNotNil: [:cls | self selectedMessageName
				ifNil: [ToolSet browseClass: cls]
				ifNotNil: [:sel | ToolSet browse: cls selector: sel]]
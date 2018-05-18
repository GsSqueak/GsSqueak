private
labelIfNeeded: aDockingBar 
	"Label the given docking bar with the project name, if needed"
	(aDockingBar submorphWithProperty: #projectNameMorph)
		contents: (Project current isTopProject ifTrue: [''] ifFalse: [Project current name]);
		fitContents
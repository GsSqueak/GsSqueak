utilities
projectHierarchy
	"Answer a string representing all the projects in the system in  
	hierarchical order."
	"Project projectHierarchy"
	^ String
		streamContents: [:aStream | self hierarchyOfNamesAndProjects
				do: [:aPair | aStream nextPutAll: aPair first;
						 cr]]
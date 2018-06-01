utilities
findAFolderForProject: aProject label: dialogLabel
	"Find a folder for saving or loading a project"

	^FileList2 modalFolderSelectorForProject: aProject

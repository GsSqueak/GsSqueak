modal dialogs
modalFolderSelectorForProject: aProject
"
FileList2 modalFolderSelectorForProject: Project current
"
	"Not currently being converted to FileSaverDialog etc because it implements the decidedly outre looking 'blue ui' Project dialog. "
	| window fileModel w |

	window := FileList2 morphicViewProjectSaverFor: aProject.
	fileModel := window valueOfProperty: #FileList.
	w := self currentWorld.
	window position: w topLeft + (w extent - window extent // 2).
	w addMorphInLayer: window.
	w startSteppingSubmorphsOf: window.
	UserInterfaceTheme current applyTo: window allMorphs.
	self modalLoopOn: window.
	^fileModel getSelectedDirectory withoutListWrapper
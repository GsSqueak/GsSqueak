own services
openProjectFromFile
	"Reconstitute a Morph from the selected file, presumed to be represent
	a Morph saved via the SmartRefStream mechanism, and open it in an
	appropriate Morphic world."

	Project canWeLoadAProjectNow ifFalse: [^ self].
	ProjectViewMorph 
		openFromDirectory: directory 
		andFileName: fileName

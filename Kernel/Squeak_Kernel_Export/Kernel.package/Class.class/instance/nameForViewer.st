class name
nameForViewer
	"Answer the name to be shown in the header of a viewer looking at the receiver"

	^ self name ifNil: ['Unnamed class']
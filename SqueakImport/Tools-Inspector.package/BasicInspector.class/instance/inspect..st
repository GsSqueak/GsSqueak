as yet unclassified
inspect: anObject 
	"Initialize the receiver so that it is inspecting anObject. There is no 
	current selection."

	self initialize.
	object := anObject.
	selectionIndex := 0.
	contents := ''
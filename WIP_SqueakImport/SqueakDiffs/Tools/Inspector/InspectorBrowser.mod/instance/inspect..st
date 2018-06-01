initialize-release
inspect: anObject 
	"Initialize the receiver so that it is inspecting anObject. There is no current selection.
	Overriden so that my class is not changed to 'anObject inspectorClass'."
	
	object := anObject.
	self initialize

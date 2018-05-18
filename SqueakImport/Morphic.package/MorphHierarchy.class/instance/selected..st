accessing
selected: aMorphListItemWrapper 
	"Change the selected object"
	| newSelection |
	aMorphListItemWrapper isNil
		ifTrue: [^ self].
	newSelection := aMorphListItemWrapper withoutListWrapper.
	newSelection == Project current world selectedObject
		ifTrue: [newSelection removeHalo]
		ifFalse: [newSelection addHalo].
	self changed: #selected
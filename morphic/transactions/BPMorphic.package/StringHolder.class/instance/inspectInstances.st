-Tools
inspectInstances
	"Inspect all instances of the selected class."
	self selectedClassOrMetaClass
		ifNotNil: [:_gsSqueakTemp_myClass | _gsSqueakTemp_myClass theNonMetaClass inspectAllInstances]
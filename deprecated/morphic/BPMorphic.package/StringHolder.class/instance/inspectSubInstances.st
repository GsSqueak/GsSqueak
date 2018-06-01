-Tools
inspectSubInstances
	"Inspect all instances of the selected class and all its subclasses"
	self selectedClassOrMetaClass
		ifNotNil: [:_gsSqueakTemp_aClass | _gsSqueakTemp_aClass theNonMetaClass inspectSubInstances]
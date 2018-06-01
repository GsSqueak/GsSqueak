release
prepareForDelete
	"The window in which the project is housed is about to deleted. Perform
	any necessary actions to prepare for deletion."

	| list |
	Smalltalk at: #WonderlandCameraMorph ifPresent:[:aClass |
		world submorphs do:   "special release for wonderlands"
					[:m | (m isKindOf: aClass)
							and: [m getWonderland release]]].
	"Remove Player classes and metaclasses owned by project"
	self myPlayerClasses do: [:playerCls | playerCls removeFromSystemUnlogged].


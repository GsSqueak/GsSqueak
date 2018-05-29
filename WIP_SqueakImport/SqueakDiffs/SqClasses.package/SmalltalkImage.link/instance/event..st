sources, changes log
event: anEvent
	"Hook for SystemChangeNotifier"

	anEvent isDoIt ifTrue: [^self logChange: anEvent item].
	(anEvent itemKind = SystemChangeNotifier categoryKind) ifTrue: [
		anEvent isAdded
			ifTrue: [^self logChange: 'SystemOrganization addCategory: ', anEvent item storeString].
		anEvent isRemoved
			ifTrue: [^self logChange: 'SystemOrganization removeSystemCategory: ', anEvent item storeString].
		anEvent isRenamed
			ifTrue: [^self logChange: 'SystemOrganization renameCategory: ', anEvent oldName storeString, ' toBe: ', anEvent newName storeString].
	].

	(anEvent itemKind = SystemChangeNotifier classKind) ifTrue: [
		anEvent item acceptsLoggingOfCompilation ifFalse: [^self].
		anEvent isAdded ifTrue: [
			self logChange: anEvent item definition.
		].
		anEvent isModified
			ifTrue: [^self logChange: anEvent item definition].
		anEvent isRemoved
			ifTrue: [^self logChange: 'Smalltalk removeClassNamed: ' , anEvent item name storeString].
		anEvent isRenamed
			ifTrue: [^self logChange: 'Smalltalk renameClassNamed: ', anEvent oldName storeString, ' as: ', anEvent newName storeString].
		anEvent isRecategorized
			ifTrue: [^self logChange: 'SystemOrganization classify: ', anEvent item name storeString, ' under: ', anEvent itemCategory storeString].
	].

	(anEvent itemKind = SystemChangeNotifier protocolKind) ifTrue: [
		anEvent isAdded
			ifTrue: [^self logChange: anEvent itemClass name , ' organization addCategory: ' , anEvent itemProtocol storeString].
		anEvent isRemoved
			ifTrue: [^self logChange: anEvent itemClass name , ' organization removeCategory: ' , anEvent itemProtocol storeString].
		anEvent isRenamed
			ifTrue: [^self logChange: anEvent itemClass name , ' organization renameCategory: ' , anEvent oldName storeString, ' toBe: ', anEvent newName storeString].
	].

	(anEvent itemKind = SystemChangeNotifier methodKind) ifTrue: [
		anEvent itemClass acceptsLoggingOfCompilation ifFalse: [^self].
		anEvent isRemoved
			ifTrue: [^self logChange: anEvent itemClass name , ' removeSelector: ' , anEvent itemSelector storeString].
		anEvent isRecategorized
			ifTrue: [
				^self logChange: anEvent itemClass name , ' organization classify: ', anEvent itemSelector storeString, ' under: ', anEvent itemProtocol storeString.
		].
	].

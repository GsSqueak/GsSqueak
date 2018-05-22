fileIn
installAllMembers
	"Try to install all the members, in order, based on their filenames and/or contents."
	| uninstalled |
	uninstalled := OrderedCollection new.
	zip members do: [ :member | self installMember: member ].
	uninstalled := self uninstalledMembers.
	uninstalled isEmpty ifTrue: [ ^self ].
	uninstalled inspect.
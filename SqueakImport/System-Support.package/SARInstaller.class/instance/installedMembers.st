accessing
installedMembers
	"Answer the zip members that have been installed already."
	^installed ifNil: [ installed := OrderedCollection new ]
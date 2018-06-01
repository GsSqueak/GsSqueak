metaclass
setClassOrganizer
	"Install whatever organization is appropriate"
	| theClass |
	classOrganizer := nil.
	metaClassOrganizer := nil.
	self hasClassSelected ifFalse: [^ self].
	theClass := self selectedClass ifNil: [ ^self ].
	classOrganizer := theClass organization.
	metaClassOrganizer := theClass classSide organization.
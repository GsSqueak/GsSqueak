metaclass
setClassOrganizer
	"Install whatever organization is appropriate"
	| theClass |
	classOrganizer := nil.
	metaClassOrganizer := nil.
	self hasClassSelected ifFalse: [^ self].
	theClass := self selectedClass ifNil: [ ^self ].
	classOrganizer := theClass organization.
	classOrganizer envId: self envId.
	metaClassOrganizer := theClass classSide organization.
	metaClassOrganizer envId: self envId
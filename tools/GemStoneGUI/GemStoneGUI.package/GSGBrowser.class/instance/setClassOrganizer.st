metaclass
setClassOrganizer
	"Install whatever organization is appropriate"
	classOrganizer := nil.
	metaClassOrganizer := nil.
	self hasClassSelected ifFalse: [^ self].
	classOrganizer := TopazClassOrganizer suppliedBy: topazProxy class: selectedClassName.
	metaClassOrganizer := TopazClassOrganizer suppliedBy: topazProxy metaclassOf: selectedClassName.
	classOrganizer env: envId.
	metaClassOrganizer env: envId
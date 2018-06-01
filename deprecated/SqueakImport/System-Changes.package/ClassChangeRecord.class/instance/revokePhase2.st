isolation layers
revokePhase2

	revertable ifFalse: [^ self].

	"Replace the original organization (and comment)."
	thisOrganization := self realClass organization.
	self realClass organization: priorOrganization.
	inForce := false.

system startup
startUpFrom: endiannessHasToBeFixed
	"Override this when a per-instance startUp message needs to be sent.  For example, to correct the order of 16-bit non-pointer data when it came from a different endian machine."

	^ nil
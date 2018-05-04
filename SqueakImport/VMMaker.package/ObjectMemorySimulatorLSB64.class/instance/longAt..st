memory access
longAt: byteAddress
	"Note: Adjusted for Smalltalk's 1-based array indexing."

	^ (super longAt: byteAddress) bitOr: ((super longAt: byteAddress + 4) bitShift: 32)
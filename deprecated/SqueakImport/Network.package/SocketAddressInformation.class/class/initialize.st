class initialization
initialize
	"SocketAddressInformation initialize"

	NumericFlag := 1.
	PassiveFlag := 2.
	AddressFamilyUnspecified := 0.
	AddressFamilyLocal := 1.
	AddressFamilyINET4 := 2.
	AddressFamilyINET6 := 3.
	SocketTypeUnspecified := 0.
	SocketTypeStream := 1.
	SocketTypeDGram := 2.
	ProtocolUnspecified := 0.
	ProtocolTCP := 1.
	ProtocolUDP := 2.

	"SocketPlugin maintains internal state across primitive calls, so methods that rely
	on the result of sequential primitive calls require concurrency control."
	PrimitiveAccessProtect := Semaphore forMutualExclusion.

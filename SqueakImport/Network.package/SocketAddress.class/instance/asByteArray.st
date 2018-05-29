converting
asByteArray
	"Assuming IPV4, answer a byte array representation of the host number"
	^ ((self hostNumber findTokens: '.')
		collect: [:e | e asInteger]) asByteArray
testing
hash
	"Hashing on directory + name should be sufficient."
	^ (self containingDirectory hash hashMultiply + self name hash) hashMultiply
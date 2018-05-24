accessing
addTrustedKey: aPublicKey
	"Add a public key to the list of trusted keys"
	trustedKeys := (trustedKeys copyWithout: aPublicKey) copyWith: aPublicKey.
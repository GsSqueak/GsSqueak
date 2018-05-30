parsing
addressesAndNamePairsIn: aString
	"return a collection of the addresses and the corresponding names listed in aString"
	| tokens |
	tokens := MailAddressTokenizer tokensIn: aString.
	^(self new initialize: tokens) grabAddressesAndNames
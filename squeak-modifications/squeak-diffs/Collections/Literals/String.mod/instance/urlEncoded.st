*network-url
urlEncoded
	"Encode the receiver, which is assumed to be URL, properly.
	This method is specific to URLs in such that it will parse
	the url and perform a semantically correct substitution, for example:

	'http://squeak.org/name with space?and=value' encodeForHTTP.
	=> 'http%3A%2F%2Fsqueak.org%2Fname%20with%20space%3Fand%3Dvalue'		

	'http://squeak.org/name with space?and=value' urlEncoded.
	=> 'http://squeak.org/name%20with%20space?and=value"

	^self asUrl asString
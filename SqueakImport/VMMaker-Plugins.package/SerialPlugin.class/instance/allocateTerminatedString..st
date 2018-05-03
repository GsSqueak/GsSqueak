private
allocateTerminatedString: unterminatedCharactersInStringObject
	"Allocate a C string with contents of a String value. May cause garbage collection."

	| len terminatedString p |
	<inline: true>
	<returnTypeC: 'char *'>
	<var: #unterminatedCharactersInStringObject type: 'char *'>
	<var: #p type: 'char *'>
	len := interpreterProxy sizeOfSTArrayFromCPrimitive: unterminatedCharactersInStringObject.
	terminatedString := interpreterProxy
		instantiateClass: interpreterProxy classString
		indexableSize: len + 1.
	p := interpreterProxy arrayValueOf: terminatedString.
	p at: len put: 0. "null terminator"
	[len >= 0] whileTrue:
		[len := len - 1.
		p at: len put: (unterminatedCharactersInStringObject at: len)].
	^ p

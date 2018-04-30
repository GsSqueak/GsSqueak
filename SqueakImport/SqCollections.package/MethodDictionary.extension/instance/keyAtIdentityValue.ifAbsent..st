*SqCollections-accessing
keyAtIdentityValue: value ifAbsent: exceptionBlock
	"Answer the key whose value equals the argument, value. If there is
	none, answer the result of evaluating exceptionBlock."

	^ self _env0 keyAtValue: value ifAbsent: exceptionBlock

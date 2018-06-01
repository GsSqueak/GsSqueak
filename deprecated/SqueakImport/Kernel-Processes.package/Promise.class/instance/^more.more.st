monad
>> resolvedBlock
	"Like >>=, but discards the result of the promise."
	^ self then: [:v | resolvedBlock value]
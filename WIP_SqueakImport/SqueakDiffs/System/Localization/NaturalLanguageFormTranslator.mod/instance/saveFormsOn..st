i/o
saveFormsOn: aStream

	| rr |
	rr := ReferenceStream on: aStream.
	rr nextPut: {id isoString. generics}.
	rr close.

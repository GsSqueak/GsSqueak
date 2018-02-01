transforming
generateGsCode
	| stream |
	stream := WriteStream on: ''.
	ast preen printOn: stream.
	^ (stream contents) , '!'
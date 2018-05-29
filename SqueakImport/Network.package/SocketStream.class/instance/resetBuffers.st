private
resetBuffers
	"Recreate the buffers with default start sizes."

	(inBuffer isNil or: [ inBuffer size ~= bufferSize ]) ifTrue: [
		inBuffer := self streamBuffer: bufferSize ].
	lastRead := 0.
	inNextToWrite := 1.
	(outBuffer isNil or: [ outBuffer size ~= bufferSize ]) ifTrue: [
		outBuffer := self streamBuffer: bufferSize ].
	outNextToWrite := 1
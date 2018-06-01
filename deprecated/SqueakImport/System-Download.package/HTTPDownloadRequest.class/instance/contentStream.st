accessing
contentStream
	"Return a stream on the content of a previously completed HTTP request"
	semaphore wait.
	^content ifNotNil:[content contentStream]
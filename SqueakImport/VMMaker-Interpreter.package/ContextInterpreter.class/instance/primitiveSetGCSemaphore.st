memory space primitives
primitiveSetGCSemaphore
	"Primitive. Indicate the semaphore to be signalled for upon garbage collection"
	| index |
	<export: true>
	index := self stackIntegerValue: 0.
	self successful ifTrue:[
		objectMemory setGcSemaphoreIndex: index.
		self pop: argumentCount.
	].
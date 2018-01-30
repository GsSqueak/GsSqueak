tracing
inboundPointers
"Answers a collection of all objects in the system that point to myself"

	^ self inboundPointersExcluding: #()
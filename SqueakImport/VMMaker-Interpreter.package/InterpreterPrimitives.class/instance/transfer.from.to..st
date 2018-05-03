utilities
transfer: count from: src to: dst 
	| in out lastIn |
	<inline: true>
	self flag: #Dan.  "Need to check all senders before converting this for 64 bits"
	in := src - objectMemory bytesPerWord.
	lastIn := in + (count * objectMemory bytesPerWord).
	out := dst - objectMemory bytesPerWord.
	[objectMemory oop: in isLessThan: lastIn]
		whileTrue: [self
				longAt: (out := out + objectMemory bytesPerWord)
				put: (objectMemory longAt: (in := in + objectMemory bytesPerWord))]
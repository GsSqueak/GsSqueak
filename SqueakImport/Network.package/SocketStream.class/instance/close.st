control
close
	"Flush any data still not sent
	and take care of the socket."

	self flush.
	socket closeAndDestroy: 30.
	"Reclaim memory consumed by possibly very large buffers."
	self resetBuffers
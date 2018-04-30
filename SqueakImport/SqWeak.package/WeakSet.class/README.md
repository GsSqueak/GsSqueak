I'm like Set but my instances only hold weakly to their elements.

Instance Variables:
	flag:		an Object which marks the empty slot in this instance. This object shouldn't be used anywhere else in the system. Every WeakSet has a different flag.

Differences from Set:
array is a WeakArray filled with flag initially. flag marks the empty slots, because elements which become garbage will be replaced with nil by the garbage collector. Besides nil, flag cannot be added to my instances.
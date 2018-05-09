A SetElement is a special wrapper used to handle addition of some special elements into Set.
This is necessary mainly for storing an UndefinedObject in a Set, since nil is used in Set algorithm to designate free slots in internal storage.

Instance Variables
	enclosedElement:		<Object>

enclosedElement
	- the real element we wish to put into the set

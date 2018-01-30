An ObjectTracer can be wrapped around another object, and then give you a chance to inspect it whenever it receives messages from the outside.  For instance...
	(ObjectTracer on: Display) flash: (50@50 extent: 50@50)
will give control to a debugger just before the message flash is sent.
Obviously this facility can be embellished in many useful ways.
See also the even more perverse subclass, ObjectViewer, and its example.

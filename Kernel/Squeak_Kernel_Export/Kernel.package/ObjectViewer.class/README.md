ObjectViewers offers the same kind of interception of messages (via doesnotUnderstand:) as ObjectTracers, but instead of just being wrappers, they actually replace the object being viewed.  This makes them a lot more dangerous to use, but one can do amazing things.  For instance, the example below actually intercepts the EventSensor object, and prints the mouse coordinates asynchronously, every time they change:
	Sensor evaluate: [Sensor cursorPoint printString displayAt: 0@0]
		wheneverChangeIn: [Sensor cursorPoint].
To exit from this example, execute:
	Sensor xxxUnTrace

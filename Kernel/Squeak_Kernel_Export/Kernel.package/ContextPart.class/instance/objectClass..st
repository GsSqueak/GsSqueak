mirror primitives
objectClass: anObject
	"Answer the class of the argument anObject without sending it a message.
	 This mimics the action of the VM when it fetches an object's class.  Used to
	 simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 111>
	self primitiveFailed
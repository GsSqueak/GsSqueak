Object is the root class for almost all of the other classes in the class hierarchy. The exceptions are ProtoObject (the superclass of Object) and its subclasses.

Class Object provides default behavior common to all normal objects, such as access, copying, comparison, error handling, message sending, and reflection. Also utility messages that all objects should respond to are defined here.

Object has no instance variables, nor should any be added. This is due to several classes of objects that inherit from Object that have special implementations (SmallInteger and UndefinedObject for example) or the VM knows about and depends on the structure and layout of certain standard classes.

Class Variables:
	DependentsFields		an IdentityDictionary
		Provides a virtual 'dependents' field so that any object may have one
		or more dependent views, synchronized by the changed:/update: protocol.
		Note that class Model has a real slot for its dependents, and overrides
		the associated protocol with more efficient implementations.
	EventsFields			an IdentityDictionary that maps each object to its dependents.
		Registers a message send (consisting of a selector and a receiver object)
		which should be performed when anEventSymbol is triggered by the receiver.
		Part of a new event notification framework which could eventually replace
		the existing changed/update mechanism.  It is intended to be compatible
		with Dolphin Smalltalk and VSE as much as possible.

Because Object is the root of the inheritance tree, methods are often defined in Object to give all objects special behaviors needed by certain subsystems or applications, or to respond to certain general test messages such as isMorph.
This is a way of serializing a tree of objects into disk file. A ReferenceStream can store
one or more objects in a persistent form, including sharing and cycles.

Here is the way to use DataStream and ReferenceStream:
	rr := ReferenceStream fileNamed: 'test.obj'.
	rr nextPut: <your object>.
	rr close.

To get it back:
	rr := ReferenceStream fileNamed: 'test.obj'.
	<your object> := rr next.
	rr close.

ReferenceStreams can now write "weak" references. nextPutWeak:
writes a "weak" reference to an object, which refers to that object
*if* it also gets written to the stream by a normal nextPut:.

A ReferenceStream should be treated as a read-stream *or* as a write-stream, *not* as a read/write-stream. The reference-remembering mechanism would probably do bad things if you tried to read and write from the same ReferenceStream.

[TBD] Should we override "close" to do (self forgetReferences)?

Instance variables
 references -- an IdentityDictionary mapping objects already written
	to their byteStream positions. If asked to write any object a
	second time, we just write a reference to its stream position.
	This handles shared objects and reference cycles between objects.
	To implement "weak references" (for Aliases), the references
	dictionary also maps objects not (yet?) written to a Collection
	of byteStream positions with hopeful weak-references to it. If
	asked to definitely write one of these objects, we'll fixup those
	weak references.
 objects -- an IdentityDictionary mapping relative byte stream positions to
	objects already read in. If asked to follow a reference, we
	return the object already read.
	This handles shared objects and reference cycles between objects.
 currentReference -- the current reference position. Positon relative to the 
	start of object data in this file.  (Allows user to cut and paste smalltalk 
	code from the front of the file without effecting the reference values.)  
	This variable is used to help install each new object in "objects" as soon
	as it's created, **before** we start reading its contents, in
	case any of its content objects reference it.
 fwdRefEnds -- A weak reference can be a forward reference, which
	requires advance-reading the referrent. When we later come to the
	object, we must get its value from "objects" and not re-read it so
	refs to it don't become refs to copies. fwdRefEnds remembers the
	ending byte stream position of advance-read objects.
 skipping -- true if <what?>
 insideASegment -- true if we are being used to collect objects that will be 
	included in an ImageSegment.  If so, UniClasses must be noted and traced.

If the object is referenced before it is done being created, it might get created twice.  Just store the object the moment it is created in the 'objects' dictionary.  If at the end, comeFullyUpOnReload returns a different object, some refs will have the temporary object (this is an unlikely case).  At the moment, no implementor of comeFullyUpOnReload returns a different object except DiskProxy, and that is OK.

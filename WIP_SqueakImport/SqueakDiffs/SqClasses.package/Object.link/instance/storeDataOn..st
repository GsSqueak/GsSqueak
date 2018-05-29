objects from disk
storeDataOn: aDataStream
	"Store myself on a DataStream.  Answer self.  This is a low-level DataStream/ReferenceStream method. See also objectToStoreOnDataStream.  NOTE: This method must send 'aDataStream beginInstance:size:' and then (nextPut:/nextPutWeak:) its subobjects.  readDataFrom:size: reads back what we write here."
	| cntInstVars cntIndexedVars |

	cntInstVars := self class instSize.
	cntIndexedVars := self basicSize.
	aDataStream
		beginInstance: self xxxClass
		size: cntInstVars + cntIndexedVars.
	1 to: cntInstVars do:
		[:i | aDataStream nextPut: (self instVarAt: i)].

	"Write fields of a variable length object.  When writing to a dummy 
		stream, don't bother to write the bytes"
	((aDataStream byteStream class == DummyStream) and: [self class isBits]) ifFalse: [
		1 to: cntIndexedVars do:
			[:i | aDataStream nextPut: (self basicAt: i)]].

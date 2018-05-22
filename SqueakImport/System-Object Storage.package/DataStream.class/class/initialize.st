as yet unclassified
initialize
	"TypeMap maps Smalltalk classes to type ID numbers which identify the data stream primitive formats.  nextPut: writes these IDs to the data stream.  NOTE: Changing these type ID numbers will invalidate all extant data stream files.  Adding new ones is OK.  
	Classes named here have special formats in the file.  If such a class has a subclass, it will use type 9 and write correctly.  It will just be slow.  (Later write the class name in the special format, then subclasses can use the type also.)
	 See nextPut:, next, typeIDFor:, & ReferenceStream>>isAReferenceType:"
	"DataStream initialize"

	| refTypes t |
	refTypes := OrderedCollection new.
	t := TypeMap := WeakIdentityKeyDictionary new. "It has to be weak, because some classes may go away, leaving obsolete versions in this dictionary which may make it corrupt."

	t at: UndefinedObject put: 1.   refTypes add: 0.
	t at: True put: 2.   refTypes add: 0.
	t at: False put: 3.   refTypes add: 0.
	t at: SmallInteger put: 4.	 refTypes add: 0.
	t at: ByteString put: 5.   refTypes add: 1.
	t at: ByteSymbol put: 6.   refTypes add: 1.
	t at: ByteArray put: 7.   refTypes add: 1.
	t at: Array put: 8.   refTypes add: 1.
	"(type ID 9 is for arbitrary instances of any class, cf. typeIDFor:)"
		refTypes add: 1.
	"(type ID 10 is for references, cf. ReferenceStream>>tryToPutReference:)"
		refTypes add: 0.
	t at: Bitmap put: 11.   refTypes add: 1.
	t at: Metaclass put: 12.   refTypes add: 0.
	"Type ID 13 is used for HyperSqueak User classes that must be reconstructed."
		refTypes add: 1.
	t at: Float put: 14.  refTypes add: 1.
	t at: Rectangle put: 15.  refTypes add: 1.	"Allow compact Rects."
	"type ID 16 is an instance with short header.  See beginInstance:size:"
		refTypes add: 1.
self flag: #ByteArray.
	t at: ByteString put: 17.   refTypes add: 1.	"new String format, 1 or 4 bytes of length"
	t at: WordArray put: 18.  refTypes add: 1.	"bitmap-like"
	t at: WordArrayForSegment put: 19.  refTypes add: 1.		"bitmap-like"
	t at: SoundBuffer put: 20.  refTypes add: 1.	"And all other word arrays, both 
		16-bit and 32-bit.  See methods in ArrayedCollection.  Overridden in SoundBuffer."
	t at: CompiledMethod put: 21.  refTypes add: 1.	"special creation method"
	"t at:  put: 22.  refTypes add: 0."
	ReferenceStream refTypes: refTypes.		"save it"

	"For all classes that are like WordArrays, store them the way ColorArray is stored.  As bits, and able to change endianness."
	Smalltalk globals do: [:cls |
		(cls isInMemory and: [
			cls isBehavior and: [
			cls isObsolete not and: [
			cls isPointers not and: [
			cls isVariable and: [
			cls isWords and: [
			(t includesKey: cls) not ] ] ] ] ] ]) 
				ifTrue: [ t at: cls put: 20 ] ]
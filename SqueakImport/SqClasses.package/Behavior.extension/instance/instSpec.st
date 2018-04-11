*SqClasses-testing
instSpec
	"Answer the instance specification part of the format that defines what kind of object
	 an instance of the receiver is.  The formats are
			0	= 0 sized objects (UndefinedObject True False et al)
			1	= non-indexable objects with inst vars (Point et al)
			2	= indexable objects with no inst vars (Array et al)
			3	= indexable objects with inst vars (Context BlockClosure AdditionalMethodState et al)
			4	= weak indexable objects with inst vars (WeakArray et al)
			5	= weak non-indexable objects with inst vars (ephemerons) (Ephemeron)
			6	= unused
			7	= immediates (SmallInteger, Character)
			8	= unused
			9	= 64-bit indexable
		10-11	= 32-bit indexable (Bitmap)					(plus one odd bit, unused in 32-bits)
		12-15	= 16-bit indexable							(plus two odd bits, one unused in 32-bits)
		16-23	= 8-bit indexable							(plus three odd bits, one unused in 32-bits)
		24-31	= compiled methods (CompiledMethod)	(plus three odd bits, one unused in 32-bits)
	 Note that in the VM instances also have a 5 bit format field that relates to their class's format.
	 Formats 11, 13-15, 17-23 & 25-31 are unused in classes but used in instances to define the
	 number of elements missing up to the slot size.  For example, a 2-byte ByteString instance
	 has format 18 in 32-bits, since its size is one 32-bit slot - 2 bytes ((18 bitAnd: 3) = 2), and
	 22 in 64 bits, since its size is one 64-bit slot - 6 bytes ((22 bitAnd: 7) = 6)."
	^(format bitShift: -16) bitAnd: 16r1F

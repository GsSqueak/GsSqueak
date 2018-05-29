instance creation
adoptInstance: anInstance
	"Change the class of anInstance to me.
	Primitive (found in Cog and new VMs)  follows the same rules as primitiveChangeClassTo:, but returns the class rather than the modified instance"

	anInstance primitiveChangeClassTo: self basicNew.
	^self

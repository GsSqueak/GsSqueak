writing
fileOutClass: extraClass andObject: theObject
	"Write a file that has both the source code for the named class and an object as bits.  Any instance-specific object will get its class written automatically."

	| class srefStream |

	self timeStamp.

	extraClass ifNotNil: [
		class := extraClass.	"A specific class the user wants written"
		class sharedPools size > 0 ifTrue: [
			class shouldFileOutPools ifTrue: [class fileOutSharedPoolsOn: self]
		].
		class fileOutOn: self moveSource: false toFile: 0
	].

	"Append the object's raw data"
	srefStream := SmartRefStream on: self.
	srefStream nextPut: theObject.  "and all subobjects"
	srefStream close.		"also closes me - well it thinks it does, anyway"

utilities
assertClassOf: oop is: classOop compactClassIndex: compactClassIndex
	"Succeed if the oop is an instance of the given class. Fail if the object is an integer.
	 If the class has a (non-zero) compactClassIndex use that to speed up the check.
	 N.B. Inlining should result in classOop not being accessed if compactClassIndex
	 is non-zero."

	<inline: true>
	self success: (objectMemory is: oop instanceOf: classOop compactClassIndex: compactClassIndex)
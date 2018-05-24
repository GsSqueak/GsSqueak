import image segment
reshapedClassesIn: outPointers
	"Look for classes in the outPointer array that have changed shape.  Make a fake class for the old shape.  Return a dictionary mapping Fake classes to Real classes.  Substitute fake classes for real ones in outPointers."

	| mapFakeClassesToReal |

	self flag: #bobconv.	


	mapFakeClassesToReal := IdentityDictionary new.
	outPointers withIndexDo: [:outp :ind | | originalName fakeCls | 
		outp isBehavior ifTrue: [
			originalName := renamed keyAtValue: outp name
				ifAbsent: [renamedConv at: ind ifAbsent: [outp name]].
				"in DiskProxy>>comeFullyUpOnReload: we saved the name at the index"
			fakeCls := self mapClass: outp origName: originalName.
			fakeCls == outp ifFalse: [
				mapFakeClassesToReal at: fakeCls put: outp.
				outPointers at: ind put: fakeCls]]].
	^ mapFakeClassesToReal
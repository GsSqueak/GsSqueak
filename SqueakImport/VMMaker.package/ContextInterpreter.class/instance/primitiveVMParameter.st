system control primitives
primitiveVMParameter
	"Behaviour depends on argument count:
		0 args:	return an Array of VM parameter values;
		1 arg:	return the indicated VM parameter;
		2 args:	set the VM indicated parameter.
	VM parameters are numbered as follows:
		1	end of old-space (0-based, read-only)
		2	end of young-space (read-only)
		3	end of memory (read-only)
		4	allocationCount (read-only)
		5	allocations between GCs (read-write)
		6	survivor count tenuring threshold (read-write)
		7	full GCs since startup (read-only)
		8	total milliseconds in full GCs since startup (read-only)
		9	incremental GCs since startup (read-only)
		10	total milliseconds in incremental GCs since startup (read-only)
		11	tenures of surving objects since startup (read-only)
		12-20 specific to the translating VM
		21	root table size (read-only)
		22	root table overflows since startup (read-only)
		23	bytes of extra memory to reserve for VM buffers, plugins, etc.
		24	memory threshold above which shrinking object memory (rw)
		25	memory headroom when growing object memory (rw)
		26  interruptChecksEveryNms - force an ioProcessEvents every N milliseconds, in case the image  is not calling getNextEvent often (rw)
		27	number of times mark loop iterated for current IGC/FGC (read-only) includes ALL marking
		28	number of times sweep loop iterated  for current IGC/FGC (read-only)
		29	number of times make forward loop iterated for current IGC/FGC (read-only)
		30	number of times compact move loop iterated for current IGC/FGC (read-only)
		31	number of grow memory requests (read-only)
		32	number of shrink memory requests (read-only)
		33	number of root table entries used for current IGC/FGC (read-only)
		34	number of allocations done before current IGC/FGC (read-only)
		35	number of survivor objects after current IGC/FGC (read-only)
		36  millisecond clock when current IGC/FGC completed (read-only)
		37  number of marked objects for Roots of the world, not including Root Table entries for current IGC/FGC (read-only)
		38  milliseconds taken by current IGC  (read-only)
		39  Number of finalization signals for Weak Objects pending when current IGC/FGC completed (read-only)
		40 BytesPerWord for this image
		
	Note: Thanks to Ian Piumarta for this primitive."

	| mem paramsArraySize result arg index statIGCDeltaTimeObj statGCTimeObj statIncrGCMSecsObj statFullGCMSecsObj resultLargePositiveInteger |
	<var: #resultLargePositiveInteger type: 'sqLong'>
	mem := objectMemory startOfMemory.
	paramsArraySize := 40.
	argumentCount = 0 ifTrue: [
		result := objectMemory instantiateClass: (objectMemory splObj: ClassArray) indexableSize: paramsArraySize.
		objectMemory pushRemappableOop:  result.
		objectMemory pushRemappableOop:  (self positive64BitIntegerFor: objectMemory getStatFullGCMSecs).
		objectMemory pushRemappableOop:  (self positive64BitIntegerFor: objectMemory getStatIncrGCMSecs).
		objectMemory pushRemappableOop:  (self positive64BitIntegerFor: objectMemory getStatGCTime).
		objectMemory pushRemappableOop:  (self positive64BitIntegerFor: objectMemory getStatIGCDeltaTime).
		statIGCDeltaTimeObj := objectMemory popRemappableOop.
		statGCTimeObj := objectMemory popRemappableOop.
		statIncrGCMSecsObj := objectMemory popRemappableOop.
		statFullGCMSecsObj := objectMemory popRemappableOop.
		result := objectMemory popRemappableOop.
		0 to: paramsArraySize - 1 do:
			[:i | objectMemory storePointer: i ofObject: result withValue: ConstZero].
	
		objectMemory storePointer: 0	ofObject: result withValue: (self positive64BitIntegerFor: objectMemory getYoungStart - mem).
		objectMemory storePointer: 1	ofObject: result withValue: (self positive64BitIntegerFor: objectMemory getFreeBlock - mem).
		objectMemory storePointer: 2	ofObject: result withValue: (self positive64BitIntegerFor: objectMemory getEndOfMemory - mem).
		objectMemory storePointer: 3	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory allocationCount).
		objectMemory storePointer: 4	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getAllocationsBetweenGCs).
		objectMemory storePointer: 5	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getTenuringThreshold).
		objectMemory storePointer: 6	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatFullGCs).
		objectMemory storePointer: 7	ofObject: result withValue: statFullGCMSecsObj.
		objectMemory storePointer: 8	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatIncrGCs).
		objectMemory storePointer: 9	ofObject: result withValue: statIncrGCMSecsObj.
		objectMemory storePointer: 10	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatTenures).
		objectMemory storePointer: 20	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getRootTableCount).
		objectMemory storePointer: 21	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatRootTableOverflows).
		objectMemory storePointer: 22	ofObject: result withValue: (self positive64BitIntegerFor: extraVMMemory).
		objectMemory storePointer: 23	ofObject: result withValue: (self positive64BitIntegerFor: objectMemory getShrinkThreshold).
		objectMemory storePointer: 24	ofObject: result withValue: (self positive64BitIntegerFor: objectMemory getGrowHeadroom).
		objectMemory storePointer: 25	ofObject: result withValue: (objectMemory integerObjectOf: interruptChecksEveryNms).
		objectMemory storePointer: 26	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatMarkCount).
		objectMemory storePointer: 27	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatSweepCount).
		objectMemory storePointer: 28	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatMkFwdCount).
		objectMemory storePointer: 29	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatCompMoveCount).
		objectMemory storePointer: 30	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatGrowMemory).
		objectMemory storePointer: 31	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatShrinkMemory).
		objectMemory storePointer: 32	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatRootTableCount).
		objectMemory storePointer: 33	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatAllocationCount).
		objectMemory storePointer: 34	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatSurvivorCount).
		objectMemory storePointer: 35	ofObject: result withValue: statGCTimeObj.
		objectMemory storePointer: 36	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatSpecialMarkCount).
		objectMemory storePointer: 37	ofObject: result withValue: statIGCDeltaTimeObj.
		objectMemory storePointer: 38	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory getStatpendingFinalizationSignals).
		objectMemory storePointer: 39	ofObject: result withValue: (objectMemory integerObjectOf: objectMemory bytesPerWord).
		objectMemory pop: 1 thenPush: result.
		^nil].

	arg := self stackTop.
	(objectMemory isIntegerObject: arg) ifFalse: [^self primitiveFail].
	arg := objectMemory integerValueOf: arg.
	resultLargePositiveInteger := -1.
	argumentCount = 1 ifTrue: [	 "read VM parameter"
		(arg < 1 or: [arg > paramsArraySize]) ifTrue: [^self primitiveFail].
		arg = 1		ifTrue: [resultLargePositiveInteger := objectMemory getYoungStart - mem].
		arg = 2		ifTrue: [resultLargePositiveInteger := objectMemory getFreeBlock - mem].
		arg = 3		ifTrue: [resultLargePositiveInteger := objectMemory getEndOfMemory - mem].
		arg = 4		ifTrue: [result := objectMemory allocationCount].
		arg = 5		ifTrue: [result := objectMemory getAllocationsBetweenGCs].
		arg = 6		ifTrue: [result := objectMemory getTenuringThreshold].
		arg = 7		ifTrue: [result := objectMemory getStatFullGCs].
		arg = 8		ifTrue: [resultLargePositiveInteger := objectMemory getStatFullGCMSecs].
		arg = 9		ifTrue: [result := objectMemory getStatIncrGCs].
		arg = 10		ifTrue: [resultLargePositiveInteger := objectMemory getStatIncrGCMSecs].
		arg = 11		ifTrue: [result := objectMemory getStatTenures].
		((arg >= 12) and: [arg <= 20]) ifTrue: [result := 0].
		arg = 21		ifTrue: [result := objectMemory getRootTableCount].
		arg = 22		ifTrue: [result := objectMemory getStatRootTableOverflows].
		arg = 23		ifTrue: [resultLargePositiveInteger := extraVMMemory].
		arg = 24		ifTrue: [resultLargePositiveInteger := objectMemory getShrinkThreshold].
		arg = 25		ifTrue: [resultLargePositiveInteger := objectMemory getGrowHeadroom].
		arg = 26		ifTrue: [result := interruptChecksEveryNms]. 
		arg = 27		ifTrue: [result := objectMemory getStatMarkCount]. 
		arg = 28		ifTrue: [result := objectMemory getStatSweepCount]. 
		arg = 29		ifTrue: [result := objectMemory getStatMkFwdCount]. 
		arg = 30		ifTrue: [result := objectMemory getStatCompMoveCount]. 
		arg = 31		ifTrue: [result := objectMemory getStatGrowMemory]. 
		arg = 32		ifTrue: [result := objectMemory getStatShrinkMemory]. 
		arg = 33		ifTrue: [result := objectMemory getStatRootTableCount]. 
		arg = 34		ifTrue: [result := objectMemory getStatAllocationCount]. 
		arg = 35		ifTrue: [result := objectMemory getStatSurvivorCount]. 
		arg = 36  	ifTrue: [resultLargePositiveInteger := objectMemory getStatGCTime]. 
		arg = 37  	ifTrue: [result := objectMemory getStatSpecialMarkCount]. 
		arg = 38  	ifTrue: [resultLargePositiveInteger := objectMemory getStatIGCDeltaTime]. 
		arg = 39  	ifTrue: [result := objectMemory getStatpendingFinalizationSignals]. 
		arg = 40  	ifTrue: [result := objectMemory bytesPerWord]. 
		resultLargePositiveInteger = -1 
			ifTrue: [self pop: 2 thenPush: (objectMemory integerObjectOf: result)]
			ifFalse: [self pop: 2 thenPush: (self positive64BitIntegerFor: resultLargePositiveInteger)].
		^nil].

	"write a VM parameter"
	argumentCount = 2 ifFalse: [^self primitiveFail].
	index := self stackValue: 1.
	(objectMemory isIntegerObject: index) ifFalse: [^self primitiveFail].
	index := objectMemory integerValueOf: index.
	index <= 0 ifTrue: [^self primitiveFail].
	self primitiveFail.
	index = 5 ifTrue: [
		result := objectMemory getAllocationsBetweenGCs.
		objectMemory setAllocationsBetweenGCs: arg.
		self initPrimCall].
	index = 6 ifTrue: [
		result := objectMemory getTenuringThreshold.
		objectMemory setTenuringThreshold: arg.
		self initPrimCall].
	index = 23 ifTrue: [
		result := extraVMMemory.
		extraVMMemory := arg.
		self initPrimCall].
	index = 24 ifTrue: [
		result := objectMemory getShrinkThreshold.
		arg > 0 ifTrue:[
			objectMemory setShrinkThreshold: arg.
			self initPrimCall]].
	index = 25 ifTrue: [
		result := objectMemory getGrowHeadroom.
		arg > 0 ifTrue:[
			objectMemory setGrowHeadroom: arg.
			self initPrimCall]].
	index = 26 ifTrue: [
		arg > 1 ifTrue:[
			result := interruptChecksEveryNms.
			interruptChecksEveryNms := arg.
			self initPrimCall]]. 

	self successful ifTrue: [
		self pop: 3 thenPush: (objectMemory integerObjectOf: result).  "return old value"
		^ nil].

	self primitiveFail.  "attempting to write a read-only parameter"




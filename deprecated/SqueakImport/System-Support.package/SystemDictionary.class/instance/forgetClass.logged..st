classes and traits
forgetClass: aClass logged: aBool 
	"Delete the class, aClass, from the system.
	Note that this doesn't do everything required to dispose of a class - to do that use Class>>removeFromSystem."

	aBool ifTrue: [SystemChangeNotifier uniqueInstance classRemoved: aClass fromCategory: aClass category].
	self organization removeElement: aClass name.
	Smalltalk removeFromStartUpList: aClass.
	Smalltalk removeFromShutDownList: aClass.
	aClass isObsolete ifFalse: [
		(self associationAt: aClass name ifAbsent: [ nil ]) ifNotNil: [ :oldBinding |
			| newBinding |
			newBinding := oldBinding shallowCopy.
			self replaceBinding: oldBinding in: aClass with: newBinding.
			(self isThisBindingReferred: oldBinding) ifTrue: [
				[oldBinding value: nil]
					on: AttemptToWriteReadOnlyGlobal
					do: [:ex | true].
				Undeclared add: oldBinding ] ] ].
	self removeKey: aClass name ifAbsent: [].
	self flushClassNameCache
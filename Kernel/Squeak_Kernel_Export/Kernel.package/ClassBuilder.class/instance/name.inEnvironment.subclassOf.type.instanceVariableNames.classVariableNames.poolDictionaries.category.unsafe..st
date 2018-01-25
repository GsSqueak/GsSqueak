class definition
name: className inEnvironment: env subclassOf: newSuper type: type instanceVariableNames: instVarString classVariableNames: classVarString poolDictionaries: poolString category: category unsafe: unsafe
	"Define a new class in the given environment.
	If unsafe is true do not run any validation checks.
	This facility is provided to implement important system changes."
	| oldClass instVars classVars copyOfOldClass newClass |
 
	environ := env.
	instVars := Scanner new scanFieldNames: instVarString.
	classVars := (Scanner new scanFieldNames: classVarString) collect: [:x | x asSymbol].

	"Validate the proposed name"
	unsafe ifFalse:[(self validateClassName: className) ifFalse:[^nil]].
	oldClass := env at: className ifAbsent:[nil].
	oldClass isBehavior 
		ifFalse: [oldClass := nil]  "Already checked in #validateClassName:"
		ifTrue: [
			copyOfOldClass := oldClass copy.
			copyOfOldClass superclass addSubclass: copyOfOldClass].
	
	
	[ | newCategory needNew force organization oldCategory |
	unsafe ifFalse:[
		"Run validation checks so we know that we have a good chance for recompilation"
		(self validateSuperclass: newSuper forSubclass: oldClass) ifFalse:[^nil].
		(self validateInstvars: instVars from: oldClass forSuper: newSuper) ifFalse:[^nil].
		(self validateClassvars: classVars from: oldClass forSuper: newSuper) ifFalse:[^nil].
		(self validateSubclassFormat: type from: oldClass forSuper: newSuper extra: instVars size) ifFalse:[^nil]].

	"See if we need a new subclass"
	needNew := self needsSubclassOf: newSuper type: type instanceVariables: instVars from: oldClass.
	needNew == nil ifTrue:[^nil]. "some error"

	(needNew and:[unsafe not]) ifTrue:[
		"Make sure we don't redefine any dangerous classes"
		(self tooDangerousClasses includes: oldClass name) ifTrue:[
			self error: oldClass name, ' cannot be changed'.
		].
		"Check if the receiver should not be redefined"
		(oldClass ~~ nil and:[oldClass shouldNotBeRedefined]) ifTrue:[
			self notify: oldClass name asText allBold, 
						' should not be redefined. \Proceed to store over it.' withCRs]].

	needNew ifTrue:[
		"Create the new class"
		newClass := self 
			newSubclassOf: newSuper 
			type: type 
			instanceVariables: instVars
			from: oldClass.
		newClass == nil ifTrue:[^nil]. "Some error"
		newClass setName: className.
		newClass environment: environ.
	] ifFalse:[
		"Reuse the old class"
		newClass := oldClass.
	].

	"Install the class variables and pool dictionaries... "
	force := (newClass declare: classVarString) | (newClass sharing: poolString).

	"... classify ..."
	newCategory := category asSymbol.
	organization := environ ifNotNil:[environ organization].
	oldClass isNil ifFalse: [oldCategory := (organization categoryOfElement: oldClass name) asSymbol].
	organization classify: newClass name under: newCategory suppressIfDefault: true.
	
	"... recompile ..."
	newClass := self recompile: force from: oldClass to: newClass mutate: false.

	"... export if not yet done ..."
	(environ at: newClass name ifAbsent:[nil]) == newClass ifFalse:[
		[environ at: newClass name put: newClass]
			on: AttemptToWriteReadOnlyGlobal do:[:ex| ex resume: true].
		environ flushClassNameCache.
	].


	newClass doneCompiling.
	"... notify interested clients ..."
	oldClass isNil ifTrue: [
		SystemChangeNotifier uniqueInstance classAdded: newClass inCategory: newCategory.
		^ newClass].
	newCategory ~= oldCategory 
		ifTrue: [SystemChangeNotifier uniqueInstance class: newClass recategorizedFrom: oldCategory to: category]
		ifFalse: [SystemChangeNotifier uniqueInstance classDefinitionChangedFrom: copyOfOldClass to: newClass.].
] ensure: 
		[copyOfOldClass ifNotNil: [copyOfOldClass superclass removeSubclass: copyOfOldClass].
		Behavior flushObsoleteSubclasses.
		].
	^newClass
fileIn/Out
checkForConversionMethods
	"See if any conversion methods are needed"
	| tell choice smart restore renamed listAdd listDrop msgSet list |

	Preferences conversionMethodsAtFileOut ifFalse: [^ self].	"Check preference"
	structures ifNil: [^ self].

	list := OrderedCollection new.
	renamed := OrderedCollection new.
	self changedClasses do: [:class | | newStruct sel oldStruct need rec |
		need := (self atClass: class includes: #new) not.
		need ifTrue: ["Renamed classes."
			(self atClass: class includes: #rename) ifTrue: [
				rec := changeRecords at: class name.
				rec priorName ifNotNil: [
					(structures includesKey: rec priorName) ifTrue: [
						renamed add: class.  need := false]]]].
		need ifTrue: [need := (self atClass: class includes: #change)].
		need ifTrue: [oldStruct := structures at: class name 
									ifAbsent: [need := false.  #()]].
		need ifTrue: [
			newStruct := (Array with: class classVersion), (class allInstVarNames).
			need := (oldStruct ~= newStruct)].
		need ifTrue: [sel := #convertToCurrentVersion:refStream:.
			(#(add change) includes: (self atSelector: sel class: class)) ifFalse: [
				list add: class]].
		].

	list isEmpty & renamed isEmpty ifTrue: [^ self].
	"Ask user if want to do this"
	tell := 'If there might be instances of ', (list asArray, renamed asArray) printString,
		'\in a project (.pr file) on someone''s disk, \please ask to write a conversion method.\'
			withCRs,
		'After you edit the conversion method, you''ll need to fileOut again.\' withCRs,
		'The preference conversionMethodsAtFileOut in category "fileout" controls this feature.'.
	choice := UIManager default chooseFrom:
'Write a conversion method by editing a prototype
These classes are not used in any object file.  fileOut my changes now.
I''m too busy.  fileOut my changes now.
Don''t ever ask again.  fileOut my changes now.' withCRs title: tell. 
	choice = 4 ifTrue: [Preferences disable: #conversionMethodsAtFileOut].
	choice = 2 ifTrue: ["Don't consider this class again in the changeSet"
			list do: [:cls | structures removeKey: cls name ifAbsent: []].
			renamed do: [:cls | | nn | 
				nn := (changeRecords at: cls name) priorName.
				structures removeKey: nn ifAbsent: []]].
	choice ~= 1 ifTrue: [^ self].	"exit if choice 2,3,4"

	listAdd := self askAddedInstVars: list.	"Go through each inst var that was added"
	listDrop := self askRemovedInstVars: list.	"Go through each inst var that was removed"
	list := (listAdd, listDrop) asSet asArray.

	smart := SmartRefStream on: (RWBinaryOrTextStream on: '12345').
	smart structures: structures.
	smart superclasses: superclasses.
	(restore := self class current) == self ifFalse: [
		self class  newChanges: self].	"if not current one"
	msgSet := smart conversionMethodsFor: list.
		"each new method is added to self (a changeSet).  Then filed out with the rest."
	self askRenames: renamed addTo: msgSet using: smart.	"renamed classes, add 2 methods"
	restore == self ifFalse: [self class newChanges: restore].
	msgSet isEmpty ifTrue: [^ self].
	self inform: 'Remember to fileOut again after modifying these methods.'.
	ToolSet 
		browseMessageSet: msgSet 
		name: 'Conversion methods for ', self name 
		autoSelect: nil
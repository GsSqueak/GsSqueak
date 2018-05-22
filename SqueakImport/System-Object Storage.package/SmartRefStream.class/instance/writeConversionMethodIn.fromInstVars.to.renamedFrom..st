class changed shape
writeConversionMethodIn: newClass fromInstVars: oldList to: newList renamedFrom: oldName
	"The method convertToCurrentVersion:refStream: was not found in newClass.  Write a default conversion method for the author to modify.  If method exists, append new info into the end."

	| code newOthers oldOthers copied newCode |

	newOthers := newList asOrderedCollection "copy".
	oldOthers := oldList asOrderedCollection "copy".
	copied := OrderedCollection new.
	newList do: [:instVar |
		(oldList includes: instVar) ifTrue: [
			instVar isInteger ifFalse: [copied add: instVar].
			newOthers remove: instVar.
			oldOthers remove: instVar]].
	code := WriteStream on: (String new: 500).
	code cr; cr; tab; nextPutAll: '"From ', SystemVersion current version, ' [', Smalltalk lastUpdateString;
			nextPutAll: '] on ', Date today printString, '"'; cr.
	code tab; nextPutAll: '"These variables are automatically stored into the new instance: '.
	code nextPutAll: copied asArray printString; nextPut: $.; cr.
	code tab; nextPutAll: 'Test for this particular conversion.'; 
		nextPutAll: '  Get values using expressions like (varDict at: ''foo'')."'; cr; cr.
	(newOthers size = 0) & (oldOthers size = 0) & (oldName == nil) ifTrue: [^ self].
		"Instance variables are the same.  Only the order changed.  No conversion needed."
	(newOthers size > 0) ifTrue: [
		code tab; nextPutAll: '"New variables: ', newOthers asArray printString, 
			'.  If a non-nil value is needed, please assign it."'; cr].
	(oldOthers size > 0) ifTrue: [
		code tab; nextPutAll: '"These are going away ', oldOthers asArray printString, 
			'.  Possibly store their info in some other variable?"'; cr].
	oldName ifNotNil: [
		code tab; nextPutAll: '"Test for instances of class ', oldName, '.'; cr.
		code tab; nextPutAll: 'Instance vars with the same name have been moved here."'; cr.
		].
	code tab; nextPutAll: '"Move your code above the ^ super...  Delete extra comments."'; cr. 

	(newClass includesSelector: #convertToCurrentVersion:refStream:) 
		ifTrue: ["append to old methods"
			newCode := (newClass sourceCodeAt: #convertToCurrentVersion:refStream:),
				code contents]
		ifFalse: ["new method"
			newCode := 'convertToCurrentVersion: varDict refStream: smartRefStrm',
				code contents, 
				'	^ super convertToCurrentVersion: varDict refStream: smartRefStrm'].
	newClass compile: newCode classified: 'object fileIn'.


	"If you write a conversion method beware that the class may need a version number change.  This only happens when two conversion methods in the same class have the same selector name.  (A) The inst var lists of the new and old versions intials as some older set of new and old inst var lists.  or (B) Twice in a row, the class needs a conversion method, but the inst vars stay the same the whole time.  (For an internal format change.)
	If either is the case, fileouts already written with the old (wrong) version number, say 2.  Your method must be able to read files that say version 2 but are really 3, until you expunge the erroneous version 2 files from the universe."

 
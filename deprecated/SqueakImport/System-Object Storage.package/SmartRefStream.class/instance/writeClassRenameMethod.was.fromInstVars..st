class changed shape
writeClassRenameMethod: sel was: oldName fromInstVars: oldList
	"The class coming is unknown.  Ask the user for the existing class it maps to.  If got one, write a method, and restart the obj fileIn.  If none, write a dummy method and get the user to complete it later.  "

| tell choice  newName answ code |

	self flag: #bobconv.	


tell := 'Reading an instance of ', oldName, '.
Which modern class should it translate to?'.
answ := (UIManager default 
		chooseFrom: #('Let me type the name now' 'Let me think about it'
'Let me find a conversion file on the disk') 
		title: tell). 

answ = 1 ifTrue: [
	tell := 'Name of the modern class {1} should translate to:' translated format: {oldName}.
	choice := UIManager default request: tell.		"class name"
	(choice size = 0) 
		ifTrue: [answ := 'conversion method needed']
		ifFalse: [newName := choice.
			answ := Smalltalk at: newName asSymbol 
				ifAbsent: ['conversion method needed'].
			answ isString ifFalse: [renamed at: oldName asSymbol put: answ name]]].
(answ = 3) | (answ = 0) ifTrue: [self close.
		^ 'conversion method needed'].
answ = 2 ifTrue: [answ := 'conversion method needed'].
answ = 'conversion method needed' ifTrue: [
		self close.  
		newName := 'PutNewClassHere'].

code := WriteStream on: (String new: 500).
code nextPutAll: sel; cr.
code cr; tab; nextPutAll: '^ ', newName.	"Return new class"

self class compile: code contents classified: 'conversion'.

newName = 'PutNewClassHere' ifTrue: [
	self inform: 'Please complete the following method and 
then read-in the object file again.'.
	SystemNavigation default browseAllImplementorsOf: sel asSymbol]. 

	"The class version number only needs to change under one specific circumstance.  That is when the first letters of the instance variables have stayed the same, but their meaning has changed.  A conversion method is needed, but this system does not know it.  
	If this is true for class Foo, define classVersion in Foo class.  
	Beware of previous object fileouts already written after the change in meaning, but before bumping the version number.  They have the old (wrong) version number, say 2.  If this is true, your method must be able to test the data and successfully read files that say version 2 but are really 3."

	^ answ
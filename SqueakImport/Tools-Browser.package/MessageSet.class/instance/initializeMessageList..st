private
initializeMessageList: anArray
	"Initialize my messageList from the given list of MethodReference or string objects.  NB: special handling for uniclasses.
	 Do /not/ replace the elements of anArray if they are already MethodReferences, so as to allow users to construct richer
	 systems, such as differencers between existing and edited versions of code."
	
	messageList := OrderedCollection new.
	anArray do:
		[:each |
		 each isMethodReference
			ifTrue: [messageList addLast: each]
			ifFalse:
				[MessageSet 
					parse: each  
					toClassAndSelector: [ :class :sel | | s |
						class ifNotNil:
							[class isUniClass
								ifTrue:
									[s := class typicalInstanceName, ' ', sel]
								ifFalse:
									[s := class name , ' ' , sel , ' {' , 
										((class organization categoryOfElement: sel) ifNil: ['']) , '}' ,
										' {', class category, '}'].
							messageList addLast: (
								MethodReference new
									setClass: class  
									methodSymbol: sel 
									stringVersion: s)]]]].
	messageListIndex := messageList isEmpty ifTrue: [0] ifFalse: [1].
	contents := ''
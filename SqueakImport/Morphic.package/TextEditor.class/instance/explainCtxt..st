explain
explainCtxt: symbol 
	"Is symbol a context variable?"

	| reply classes text cls |
	symbol = #nil ifTrue: [reply := '"is a constant.  It is the only instance of class UndefinedObject.  nil is the initial value of all variables."'].
	symbol = #true ifTrue: [reply := '"is a constant.  It is the only instance of class True and is the receiver of many control messages."'].
	symbol = #false ifTrue: [reply := '"is a constant.  It is the only instance of class False and is the receiver of many control messages."'].
	symbol = #thisContext ifTrue: [reply := '"is a context variable.  Its value is always the Context which is executing this method."'].
	(model respondsTo: #selectedClassOrMetaClass) ifTrue: [
		cls := model selectedClassOrMetaClass].
	cls ifNil: [^ reply].	  "no class known"
	symbol = #self ifTrue: 
			[classes := cls withAllSubclasses.
			classes size > 12
				ifTrue: [text := cls printString , ' or a subclass']
				ifFalse: 
					[classes := classes printString.
					text := 'one of these classes' , (classes copyFrom: 4 to: classes size)].
			reply := '"is the receiver of this message; an instance of ' , text , '"'].
	symbol = #super ifTrue: [reply := '"is just like self.  Messages to super are looked up in the superclass (' , cls superclass printString , ')"'].
	^reply
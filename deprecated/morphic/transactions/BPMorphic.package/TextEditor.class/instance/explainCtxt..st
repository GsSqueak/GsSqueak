explain
explainCtxt: symbol 
	"Is symbol a context variable?"
	| _gsSqueakTemp_reply _gsSqueakTemp_classes _gsSqueakTemp_text _gsSqueakTemp_cls |
	symbol = #nil
		ifTrue: [_gsSqueakTemp_reply := '"is a constant.  It is the only instance of class UndefinedObject.  nil is the initial value of all variables."'].
	symbol = #true
		ifTrue: [_gsSqueakTemp_reply := '"is a constant.  It is the only instance of class True and is the receiver of many control messages."'].
	symbol = #false
		ifTrue: [_gsSqueakTemp_reply := '"is a constant.  It is the only instance of class False and is the receiver of many control messages."'].
	symbol = #thisContext
		ifTrue: [_gsSqueakTemp_reply := '"is a context variable.  Its value is always the MethodContext which is executing this method."'].
	(model respondsTo: #selectedClassOrMetaClass)
		ifTrue: [_gsSqueakTemp_cls := model selectedClassOrMetaClass].
	_gsSqueakTemp_cls
		ifNil: [^ _gsSqueakTemp_reply].
	"no class known"
	symbol = #self
		ifTrue: [_gsSqueakTemp_classes := _gsSqueakTemp_cls withAllSubclasses.
			_gsSqueakTemp_classes size > 12
				ifTrue: [_gsSqueakTemp_text := _gsSqueakTemp_cls printString , ' or a subclass']
				ifFalse: [_gsSqueakTemp_classes := _gsSqueakTemp_classes printString.
					_gsSqueakTemp_text := 'one of these classes'
								, (_gsSqueakTemp_classes copyFrom: 4 to: _gsSqueakTemp_classes size)].
			_gsSqueakTemp_reply := '"is the receiver of this message; an instance of ' , _gsSqueakTemp_text , '"'].
	symbol = #super
		ifTrue: [_gsSqueakTemp_reply := '"is just like self.  Messages to super are looked up in the superclass (' , _gsSqueakTemp_cls superclass printString , ')"'].
	^ _gsSqueakTemp_reply
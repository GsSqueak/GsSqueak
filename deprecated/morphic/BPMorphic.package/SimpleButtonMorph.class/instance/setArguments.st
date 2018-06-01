menu
setArguments
	| _gsSqueakTemp_s _gsSqueakTemp_newArgs _gsSqueakTemp_newArgsArray |
	_gsSqueakTemp_s := WriteStream on: ''.
	arguments
		do: [:arg | 
			arg printOn: _gsSqueakTemp_s.
			_gsSqueakTemp_s nextPutAll: '. '].
	_gsSqueakTemp_newArgs := UIManager default request: 'Please type the arguments to be sent to the target
when this button is pressed separated by periods' translated initialAnswer: _gsSqueakTemp_s contents.
	_gsSqueakTemp_newArgs isEmpty
		ifFalse: [_gsSqueakTemp_newArgsArray := Compiler evaluate: '{' , _gsSqueakTemp_newArgs , '}' for: self.
			self arguments: _gsSqueakTemp_newArgsArray]
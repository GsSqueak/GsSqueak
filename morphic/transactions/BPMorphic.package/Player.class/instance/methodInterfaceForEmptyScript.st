scripts-kernel
methodInterfaceForEmptyScript
	"Answer a MethodInterface representing Andreas's 'emptyScript'
	feature "
	| _gsSqueakTemp_anInterface |
	_gsSqueakTemp_anInterface := MethodInterface new.
	_gsSqueakTemp_anInterface receiverType: #Player.
	_gsSqueakTemp_anInterface flagAttribute: #scripts.
	_gsSqueakTemp_anInterface
		wording: (ScriptingSystem wordingForOperator: #emptyScript);
		 helpMessage: 'an empty script; drop on desktop to get a new empty script for this object'.
	_gsSqueakTemp_anInterface
		selector: #emptyScript
		type: nil
		setter: nil.
	^ _gsSqueakTemp_anInterface
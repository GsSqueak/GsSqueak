newspeak bytecode support
enclosingObjectAt: depth withObject: methodReceiver withMixin: methodMixin 
	"This is used to implement outer sends and outer expressions in
	Newspeak. "
	| _gsSqueakTemp_enclosingObject _gsSqueakTemp_mixinApplication _gsSqueakTemp_targetMixin _gsSqueakTemp_count |
	_gsSqueakTemp_enclosingObject := methodReceiver.
	_gsSqueakTemp_targetMixin := methodMixin.
	_gsSqueakTemp_count := 0.
	[_gsSqueakTemp_count < depth]
		whileTrue: [_gsSqueakTemp_count := _gsSqueakTemp_count + 1.
			self deny: _gsSqueakTemp_targetMixin = objectMemory nilObject.
			_gsSqueakTemp_mixinApplication := self
						findApplicationOfTargetMixin: _gsSqueakTemp_targetMixin
						startingAtBehavior: (objectMemory fetchClassOf: _gsSqueakTemp_enclosingObject).
			self deny: _gsSqueakTemp_mixinApplication = objectMemory nilObject.
			_gsSqueakTemp_enclosingObject := objectMemory followObjField: EnclosingObjectIndex ofObject: _gsSqueakTemp_mixinApplication.
			_gsSqueakTemp_targetMixin := objectMemory followObjField: EnclosingMixinIndex ofObject: _gsSqueakTemp_targetMixin].
	^ _gsSqueakTemp_enclosingObject
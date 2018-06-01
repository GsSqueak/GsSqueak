newspeak bytecode support
findApplicationOfTargetMixin: targetMixin startingAtBehavior: aBehavior 
	"This is used to implement implicit receiver and enclosing object
	lookup for Newspeak. Find the mixin applcation of which aClass is a
	subclass that
	is an application of targetMixin. This is an implementation derived
	from 
	<ContextPart> findApplicationOf: targetMixin startingAt: aBehavior
	"
	| _gsSqueakTemp_mixinApplication _gsSqueakTemp_mixin |
	_gsSqueakTemp_mixinApplication := aBehavior.
	[_gsSqueakTemp_mixinApplication = objectMemory nilObject
		or: [_gsSqueakTemp_mixinApplication = targetMixin
				or: [(_gsSqueakTemp_mixin := objectMemory followObjField: MixinIndex ofObject: _gsSqueakTemp_mixinApplication) = targetMixin]]]
		whileFalse: [_gsSqueakTemp_mixinApplication := objectMemory followObjField: SuperclassIndex ofObject: _gsSqueakTemp_mixinApplication].
	_gsSqueakTemp_mixinApplication = objectMemory nilObject
		ifTrue: [self print: 'looking for ';
				 cr.
			self longPrintOop: targetMixin;
				 cr.
			self print: ' in behavior ';
				 cr.
			self longPrintOop: aBehavior;
				 cr].
	^ _gsSqueakTemp_mixinApplication
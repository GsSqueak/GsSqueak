stepping and presenter
step
	| _gsSqueakTemp_s |
	super step.
	hasFocus
		ifFalse: ["update contents, but only if user isn't editing this string"
			_gsSqueakTemp_s := self readFromTarget.
			_gsSqueakTemp_s = contents
				ifFalse: [self updateContentsFrom: _gsSqueakTemp_s]]
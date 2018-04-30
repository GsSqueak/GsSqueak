insert and delete
deletePage
	| _gsSqueakTemp_message |
	_gsSqueakTemp_message := 'Are you certain that you
want to delete this page and
everything that is on it? ' translated.
	(self confirm: _gsSqueakTemp_message)
		ifTrue: [self deletePageBasic]
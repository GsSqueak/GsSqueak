insert and delete
deletePage

	| message |
	message := 
'Are you certain that you
want to delete this page and
everything that is on it? ' translated.
	(self confirm: message) ifTrue: 
			[self deletePageBasic].
	
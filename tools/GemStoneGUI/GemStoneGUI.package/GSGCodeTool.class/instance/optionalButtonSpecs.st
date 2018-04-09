toolbuilder
optionalButtonSpecs
	"Answer a tuple defining buttons, in the format:
			button label
			selector to send
			help message"
	^ #(
	('browse'			browseMethodFull			'view this method in a browser')
	('senders' 			browseSenders				'browse senders of...')
	('implementors'		browseImplementors		'browse implementors of...')
	('versions'			browseVersions				'browse versions')
	('inheritance'		browseMethodHierarchy	'browse method inheritance
green: sends to super
tan: has override(s)
mauve: both of the above
pink: is an override but doesn''t call super
pinkish tan: has override(s), also is an override but doesn''t call super' )
	('hierarchy'		browseClassHierarchy				'browse class hierarchy')
	('vars'			browseVariableReferences			'references...'))
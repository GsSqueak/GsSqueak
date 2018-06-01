controls
optionalButtonPairs
	"Answer a tuple (formerly pairs) defining buttons, in the format:
			button label
			selector to send
			help message"

	| aList |

	aList := #(
	('browse'			browseMethodFull			'view this method in a browser')
	('senders' 			browseSendersOfMessages	'browse senders of...')
	('implementors'		browseMessages				'browse implementors of...')
	('versions'			browseVersions				'browse versions')), 

	(Preferences decorateBrowserButtons
		ifTrue:
			[{#('inheritance'		methodHierarchy 'browse method inheritance
green: sends to super
tan: has override(s)
mauve: both of the above
pink: is an override but doesn''t call super
pinkish tan: has override(s), also is an override but doesn''t call super' )}]
		ifFalse:
			[{#('inheritance'		methodHierarchy			'browse method inheritance')}]),

	#(
	('hierarchy'		classHierarchy				'browse class hierarchy')
	('vars'			browseVariableReferences			'references...')).

	^ aList
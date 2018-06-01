private
translatedQuads: quads
	"private - convert the given quads to a translated one"
	
	| translatedQuads |

	translatedQuads := quads collect: [:each |
		| element |
		element := each copy. 
		element at: 3 put: each third translated.
		element at: 4 put: each fourth translated.
		element.
	].

	^ translatedQuads

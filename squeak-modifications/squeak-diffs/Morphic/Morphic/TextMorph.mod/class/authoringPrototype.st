scripting
authoringPrototype
	| t |
	t := super authoringPrototype.
	t contents: 'abc' translated asText.
	t wrapFlag: true. 

"Strangeness here in order to avoid two offset copies of the default contents when operating in an mvc project before cursor enters the morphic window"
	t paragraph.
	^ t
just like textMorph
contents: textOrString
	"talk to my text"
	| tm newText atts |

	(tm := self findA: TextMorph) ifNil: [^ nil].
	textOrString isString ifTrue: [
		tm contents ifNotNil: ["Keep previous properties of the field"
			newText := textOrString asText.
			atts := tm contents attributesAt: 1.
			atts do: [:each | newText addAttribute: each].
			^ tm contents: newText]].

	^ tm contents: textOrString
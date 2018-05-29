as yet unclassified
removeJumpEndFor: aString

	| anchors |

	anchors := OrderedCollection new.
	text runs withStartStopAndValueDo: [:start :stop :attributes |
		attributes do: [:att |
			(att isMemberOf: TextPlusJumpEnd) ifTrue: [
				att jumpLabel == aString ifTrue: [
					anchors add: {att. start. stop}
				]
			]
		]
	].
	anchors do: [ :old |
		text removeAttribute: old first from: old second to: old third.
	].


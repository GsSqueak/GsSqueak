-Tools
withSelectorAndMessagesIn: aCompiledMethod evaluate: aBlock 
	"Allow the user to choose one selector, chosen from the currently
	selected message's selector, as well as those of all messages sent by
	it, and evaluate aBlock on behalf of chosen selector. If there is only
	one possible choice, simply make it; if there are multiple choices, put
	up a menu, and evaluate aBlock on behalf of the the chosen selector,
	doing nothing if the user declines to choose any"
	| _gsSqueakTemp_selectorOrNil _gsSqueakTemp_litGetter _gsSqueakTemp_messages |
	_gsSqueakTemp_selectorOrNil := aCompiledMethod selector.
	_gsSqueakTemp_messages := SystemNavigation thoroughSenders
				ifTrue: [_gsSqueakTemp_litGetter := [:set :l | 
							(l isSymbol
									and: [l size > 0
											and: [l first isLowercase]])
								ifTrue: [set add: l].
							l isArray
								ifTrue: [l inject: set into: _gsSqueakTemp_litGetter copy].
							set].
					aCompiledMethod allLiterals
						, (aCompiledMethod pragmas
								collect: [:pragma | pragma keyword]) inject: aCompiledMethod messages into: _gsSqueakTemp_litGetter copy]
				ifFalse: [aCompiledMethod messages].
	(_gsSqueakTemp_messages isEmpty
			or: ["if no messages, use only selector"
				_gsSqueakTemp_messages size = 1
					and: [_gsSqueakTemp_messages includes: _gsSqueakTemp_selectorOrNil]])
		ifTrue: [^ _gsSqueakTemp_selectorOrNil
				ifNotNil: [aBlock value: _gsSqueakTemp_selectorOrNil]].
	"If only one item, there is no choice"
	self systemNavigation
		showMenuOf: _gsSqueakTemp_messages
		withFirstItem: _gsSqueakTemp_selectorOrNil
		ifChosenDo: aBlock
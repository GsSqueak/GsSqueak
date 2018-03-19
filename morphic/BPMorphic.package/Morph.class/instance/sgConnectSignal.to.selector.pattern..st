-signals-morphic
sgConnectSignal: aSignal to: receiver selector: aSelector pattern: argPattern 
	"Connect owner-chain-signals with this receiver. Highly dynamic as
	sender is unknown at the time of connection setup."
	"Convert pattern array to custom pattern object."
	| _gsSqueakTemp_numArgsSender _gsSqueakTemp_numArgsReceiver _gsSqueakTemp_fixedPattern |
	_gsSqueakTemp_fixedPattern := argPattern
				ifNotNil: [SignalConnectionPattern new mapping: argPattern].
	"Check if messages are available."
	(receiver respondsTo: aSelector)
		ifFalse: [Error signal: 'Could not connect signal to receiver!'].
	"Check if sender sends at least enough arguments if pattern is empty."
	_gsSqueakTemp_numArgsSender := aSignal
				count: [:c | c = $:].
	_gsSqueakTemp_numArgsReceiver := aSelector
				count: [:c | c = $:].
	(_gsSqueakTemp_numArgsSender < _gsSqueakTemp_numArgsReceiver
			and: [_gsSqueakTemp_fixedPattern isNil])
		ifTrue: [Error signal: 'Could not connect sender to receiver! Receiver expects more arguments!'].
	"Check if pattern size is correct."
	_gsSqueakTemp_fixedPattern
		ifNotNil: [(((_gsSqueakTemp_fixedPattern hasIndices not
							or: [_gsSqueakTemp_fixedPattern minIndex >= 0])
						and: [_gsSqueakTemp_numArgsReceiver == _gsSqueakTemp_fixedPattern size])
					and: [_gsSqueakTemp_fixedPattern hasIndices not
							or: [_gsSqueakTemp_numArgsSender >= _gsSqueakTemp_fixedPattern maxIndex]])
				ifFalse: [Error signal: 'Could not connect sender to receiver! Pattern is invalid!']].
	"Auto-truncate unnecessary arguments if pattern is not given."
	(_gsSqueakTemp_numArgsSender > _gsSqueakTemp_numArgsReceiver
			and: [_gsSqueakTemp_fixedPattern isNil])
		ifTrue: [_gsSqueakTemp_fixedPattern := SignalConnectionPattern new
						mapping: ((1 to: _gsSqueakTemp_numArgsReceiver)
								collect: [:i | i])].
	"Add the connection."
	((self signalConnectionsForOwnerChain
		at: aSignal
		ifAbsentPut: [WeakIdentityKeyDictionary new])
		at: receiver
		ifAbsentPut: [OrderedCollection new])
		add: (SignalConnectionConfiguration new selector: aSelector;
				 pattern: _gsSqueakTemp_fixedPattern)
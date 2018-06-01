slot getters/setters
getCardNumber
	"Answer the current card number"
	| _gsSqueakTemp_aStack |
	^ (_gsSqueakTemp_aStack := self stackEmbodied) cardNumberOf: _gsSqueakTemp_aStack currentCard
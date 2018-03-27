button pane
browseMessages
	"Present a menu of the currently selected message, as well as all messages sent by it.  Open a message set browser of all senders of the selector chosen."

	| selector messageList |
	selector := UIManager default request: 'Type selector:' initialAnswer: 'flag:'.
	selector := (selector copyWithout: Character space) asSymbol.
	^ selector isEmptyOrNil ifFalse: [
		messageList := self interface environment: self environment implementorsOf: selector env: self envId.
		self browseMessageList: messageList name: 'Implementors of ' , selector]
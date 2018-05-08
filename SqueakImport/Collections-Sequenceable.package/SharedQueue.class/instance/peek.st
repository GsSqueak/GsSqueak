accessing
peek
	"Answer the object that was sent through the receiver first and has not 
	yet been received by anyone but do not remove it from the receiver. If 
	no object has been sent, return nil"

	^readSynch
		critical: [
			accessProtect critical: [
				readPosition >= writePosition ifFalse: [
					contentsArray at: readPosition ] ] ]
		ifLocked: [ nil ]
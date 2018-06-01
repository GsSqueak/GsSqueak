private
runBlock: aBlock pollingEvery: pollPeriod 
	| list result |
	block := MessageSend 
				receiver: self
				selector: #runBlock:pollingEvery:
				arguments: { 
						aBlock.
						pollPeriod}.	"so we can re-run it"
	tally := MessageTally new.
	tally
		reportOtherProcesses: false;
		maxClassNameSize: 1000;
		maxClassPlusSelectorSize: 1000;
		maxTabs: 100.
	result := tally spyEvery: pollPeriod on: aBlock.
	list := OrderedCollection withAll: (String streamContents: [ :s | tally report: s]) lines.
	self initializeMessageList: list.
	self changed: #messageList.
	self changed: #messageListIndex.
	^result
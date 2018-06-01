initialize
setInterpreter: anInterpreter 
	"Note: This is coded so that is can be run from Squeak."

	| ok |
	<export: true>
	<var: #anInterpreter type: #'struct VirtualMachine*'>
	interpreterProxy := anInterpreter.
	ok := self cCode: 'interpreterProxy->majorVersion() == VM_PROXY_MAJOR'.
	ok == false ifTrue: [^ false].
	ok := self cCode: 'interpreterProxy->minorVersion() >= VM_PROXY_MINOR'.
	^ ok
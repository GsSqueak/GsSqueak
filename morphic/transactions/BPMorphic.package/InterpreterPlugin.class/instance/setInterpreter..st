initialize
setInterpreter: anInterpreter 
	"Note: This is coded so that is can be run from Squeak."
	| _gsSqueakTemp_ok |
	<export: true>
	<var: #anInterpreter type: #'struct VirtualMachine*'>
	interpreterProxy := anInterpreter.
	_gsSqueakTemp_ok := self cCode: 'interpreterProxy->majorVersion() == VM_PROXY_MAJOR'.
	_gsSqueakTemp_ok == false
		ifTrue: [^ false].
	_gsSqueakTemp_ok := self cCode: 'interpreterProxy->minorVersion() >= VM_PROXY_MINOR'.
	^ _gsSqueakTemp_ok
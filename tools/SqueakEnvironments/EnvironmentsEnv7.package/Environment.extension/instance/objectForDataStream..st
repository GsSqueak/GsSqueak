*EnvironmentsEnv7-emulating
objectForDataStream: refStrm 
	"I am about to be written on an object file. Write a reference to
	Smalltalk instead."
	| _gsSqueakTemp_dp |
	_gsSqueakTemp_dp := DiskProxy
				global: #Smalltalk
				selector: #globals
				args: #().
	refStrm replace: self with: _gsSqueakTemp_dp.
	^ _gsSqueakTemp_dp

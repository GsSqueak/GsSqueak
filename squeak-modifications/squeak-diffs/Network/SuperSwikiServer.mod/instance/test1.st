testing
test1

	| localDirectory localFileName local resp |

	localDirectory := FileDirectory default.
	localFileName := 'superTest1.07Oct1611.cs'.
	local := localDirectory oldFileNamed: localFileName.
	resp := self putFile: local named: localFileName retry: false.
	local close.
	^resp

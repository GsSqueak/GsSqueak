midi monitor
printCmd: cmdByte with: arg1 with: arg2
	"Print the given MIDI command."

	| cmd ch bend |
	cmdByte < 240
		ifTrue: [  "channel message" 
			cmd := cmdByte bitAnd: 2r11110000.
			ch := (cmdByte bitAnd: 2r00001111) + 1]
		ifFalse: [cmd := cmdByte].  "system message"

	cmd = 128 ifTrue: [
		^ Transcript show: ('key up ', arg1 printString, ' vel: ', arg2 printString, ' chan: ', ch printString); cr].
	cmd = 144 ifTrue: [
		^ Transcript show: ('key down: ', arg1 printString, ' vel: ', arg2 printString, ' chan: ', ch printString); cr].
	cmd = 160 ifTrue: [
		^ Transcript show: ('key pressure: ', arg1 printString, ' val: ', arg2 printString, ' chan: ', ch printString); cr].
	cmd = 176 ifTrue: [
		^ Transcript show: ('CC', arg1 printString, ': val: ', arg2 printString, ' chan: ', ch printString); cr].
	cmd = 192 ifTrue: [
		^ Transcript show: ('prog: ', (arg1 + 1) printString, ' chan: ', ch printString); cr].
	cmd = 208 ifTrue: [
		^ Transcript show: ('channel pressure ', arg1 printString, ' chan: ', ch printString); cr].
	cmd = 224 ifTrue: [
		bend := ((arg2 bitShift: 7) + arg1) - 8192.
		^ Transcript show: ('bend: ', bend printString, ' chan: ', ch printString); cr].

	cmd = 240 ifTrue: [
		^ Transcript show: ('system exclusive: ', (arg1 at: 1) printString, ' (', arg1 size printString, ' bytes)'); cr].

	Transcript show: 'cmd: ', cmd printString, ' arg1: ', arg1 printString, ' arg2: ', arg2 printString; cr.

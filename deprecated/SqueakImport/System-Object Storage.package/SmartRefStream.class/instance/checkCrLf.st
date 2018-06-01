read write
checkCrLf
	| save isCrLf cc loneLf |
	"Watch for a file that has had all of its Cr's converted to CrLf's.  Some unpacking programs like Stuffit 5.0 do this by default!"

	save := byteStream position.
	isCrLf := false.  loneLf := false.
	cc := 0.
	350 timesRepeat: [ | prev |
		prev := cc.
		(cc := byteStream next) = 16r0A "Lf" ifTrue: [
			prev = 16r0D "Cr" ifTrue: [isCrLf := true] ifFalse: [loneLf := true]].
		].
	isCrLf & (loneLf not) ifTrue: [
		self inform: 'Carriage Returns in this file were converted to CrLfs 
by an evil unpacking utility.  Please set the preferences in 
StuffIt Expander to "do not convert file formats"'].
	byteStream position: save.

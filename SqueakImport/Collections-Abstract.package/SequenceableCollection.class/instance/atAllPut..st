accessing
atAllPut: anObject 
	"Put anObject at every one of the receiver's indices."

	| size |
	(size := self size) > 50 "first method faster for larger sizes; see below"
		ifTrue: [self from: 1 to: size put: anObject]
		ifFalse: [1 to: size do: [:index | self at: index put: anObject]]

	"Here's code to test what's a good cross over."
	"(1 to: 3) collect:
		[:j|
		{ Array. ByteArray. FloatArray. WordArray } collect:
			[:class| | a e |
			a := class new: 250.
			e := a at: 1.
			(1 to: a size) detect:
				[:n| | t1 t2 |
				t1 := [1 to: 1000 do: [:i| a from: 1 to: n put: e]] timeToRun.
				t2 := [1 to: 1000 do: [:i| 1 to: n do: [:index | a at: index put: e]]] timeToRun.
				t1 < t2]]]"
	"32-bit Spur x86 #(#(69 54 9 63) #(64 52 10 55) #(63 53 9 61))"
	"64-bit Spur x86-64 #(#(63 50 10 55) #(60 48 10 54) #(63 44 9 50))"
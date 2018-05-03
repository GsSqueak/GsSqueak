primitives
primitiveClipboardPut
	"Set the clipboard to a UTF16 string.."

	| strOop count utf16 utf16Length |
	<export: true>
	<var: 'utf16' declareC: 'unsigned short *utf16'>

	strOop := interpreterProxy stackValue: 1.
	count := interpreterProxy stackIntegerValue: 0.

	((interpreterProxy isIntegerObject: strOop) or:
	 [(interpreterProxy isWords: strOop) not]) ifTrue: [
		interpreterProxy success: false].

	interpreterProxy failed ifTrue: [^ 0].

	utf16 := self cCoerce: (interpreterProxy firstIndexableField: strOop) to: 'unsigned short *'.
	utf16Length := 2 * (interpreterProxy stSizeOf: strOop).
	((count >= 0) & (count < utf16Length)) ifTrue: [utf16Length := count].

	self cCode: 'unicodeClipboardPut(utf16, utf16Length)'.

	interpreterProxy pop: 2.  "pop args, leave rcvr on stack"
	^ 0

primitives
primGetFrame
	"Copy a camera frame into the given Bitmap. The Bitmap should be for a Form of depth 32 that is the same width and height as the current camera frame. Fail if the camera is not open or if the bitmap is not the right size. If successful, answer the number of frames received from the camera since the last call. If this is zero, then there has been no change."

	| cameraNum bitmapOop bitmap pixCount result |
	<export: true>
	<var: 'bitmap' declareC: 'unsigned char *bitmap'>

	cameraNum := interpreterProxy stackIntegerValue: 1.
	bitmapOop := interpreterProxy stackValue: 0.
	((interpreterProxy isIntegerObject: bitmapOop) or:
	 [(interpreterProxy isWords: bitmapOop) not]) ifTrue: [
		interpreterProxy success: false.
		^ 0].
	bitmap := self cCoerce: (interpreterProxy firstIndexableField: bitmapOop) to: 'unsigned char *'.
	pixCount := interpreterProxy stSizeOf: bitmapOop.

	result := self cCode: 'CameraGetFrame(cameraNum, bitmap, pixCount)'.
	result < 0 ifTrue: [
		interpreterProxy success: false.
		^ 0].

	interpreterProxy pop: 3 thenPush: (interpreterProxy integerObjectOf: result).  "pop rcvr & args, push int result"
	^ 0


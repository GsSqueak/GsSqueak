initialization
initializeContextIndices
	"Class MethodContext"
	SenderIndex := 0.
	InstructionPointerIndex := 1.
	StackPointerIndex := 2.
	MethodIndex := 3.
	ClosureIndex := 4. "N.B. Called receiverMap in the image."
	ReceiverIndex := 5.
	TempFrameStart := 6.  "Note this is in two places!"

	"Class BlockContext"
	CallerIndex := 0.
	BlockArgumentCountIndex := 3.
	InitialIPIndex := 4.
	HomeIndex := 5.

	"Class BlockClosure"
	ClosureOuterContextIndex := 0.
	ClosureStartPCIndex := 1.
	ClosureNumArgsIndex := 2.
	ClosureFirstCopiedValueIndex := 3.

	CtxtTempFrameStart := 6.  "Copy of TempFrameStart in Interp"

	"n.b. The constants SmallContextSize and LargeContextSize are not required.
	See ObjectMemory>>smallContextSize and ObjectMemory>>largeContextSize
	for implementations that work for both 32 and 64 bit object memory."

initialization
initializeFrameIndices
	"Format of a stack frame. Word-sized indices relative to the frame
	pointer. Terminology
	Frames are either single (have no context) or married (have a
	context). Contexts are either single (exist on the heap), married (have
	a context) or widowed (had a frame that has exited).
	Stacks grow down:
	
	receiver for method activations/closure for block activations
	arg0
	...
	argN
	caller's method ip/base frame's sender context
	fp->	saved fp
	method
	frame flags
	context (uninitialized)
	receiver
	first temp
	...
	sp->	Nth temp
	
	frame flags holds the number of arguments (since argument
	temporaries are above the frame)
	the flag for a block activation
	and the flag indicating if the context field is valid (whether the frame
	is married).
	
	The first frame in a stack page is the baseFrame and is marked as
	such by a null saved fp,
	in which case the saved method ip is actually the context (possibly
	hybrid) beneath the base frame"
	| _gsSqueakTemp_fxCallerSavedIP _gsSqueakTemp_fxSavedFP _gsSqueakTemp_fxMethod _gsSqueakTemp_fxFrameFlags _gsSqueakTemp_fxThisContext _gsSqueakTemp_fxReceiver |
	_gsSqueakTemp_fxCallerSavedIP := 1.
	_gsSqueakTemp_fxSavedFP := 0.
	_gsSqueakTemp_fxMethod := -1.
	_gsSqueakTemp_fxFrameFlags := -2.
	"Can find numArgs, needed for fast temp access. args are above
	fxCallerSavedIP. Can find ``is block'' bit
	Can find ``has context'' bit"
	_gsSqueakTemp_fxThisContext := -3.
	_gsSqueakTemp_fxReceiver := -4.
	FrameSlots := _gsSqueakTemp_fxCallerSavedIP - _gsSqueakTemp_fxReceiver + 1.
	FoxCallerSavedIP := _gsSqueakTemp_fxCallerSavedIP * BytesPerWord.
	"In base frames the caller saved ip field holds the caller context."
	FoxCallerContext := FoxCallerSavedIP.
	FoxSavedFP := _gsSqueakTemp_fxSavedFP * BytesPerWord.
	FoxMethod := _gsSqueakTemp_fxMethod * BytesPerWord.
	FoxFrameFlags := _gsSqueakTemp_fxFrameFlags * BytesPerWord.
	FoxThisContext := _gsSqueakTemp_fxThisContext * BytesPerWord.
	FoxReceiver := _gsSqueakTemp_fxReceiver * BytesPerWord.
	"Mark the CoInterpreter-specific offsets as #undefined to
	avoid including them accidentally in StackInterpreter code."
	IFrameSlots := #undefined.
	MFrameSlots := #undefined.
	FoxIFrameFlags := #undefined.
	FoxIFSavedIP := #undefined.
	FoxIFReceiver := #undefined.
	FoxMFReceiver := #undefined
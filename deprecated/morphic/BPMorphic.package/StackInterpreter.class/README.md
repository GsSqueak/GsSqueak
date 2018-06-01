This class is a complete implementation of the Smalltalk-80 virtual machine, derived originally from the Blue Book specification but quite different in some areas.  This VM supports Closures but *not* old-style BlockContexts.

It has been modernized with 32-bit (and indeed 64-bit) pointers, better management of Contexts (see next item), and attention to variable use that allows the CCodeGenerator (qv) to keep, eg, the instruction pointer and stack pointer in registers as well as keeping most simple variables in a global array that seems to improve performance for most platforms.

The VM does not use Contexts directly.  Instead Contexts serve as proxies for a more conventional stack format that is invisible to the image.  There is considerable explanation at http://www.mirandabanda.org/cogblog/2009/01/14/under-cover-contexts-and-the-big-frame-up.  The VM maintains a fixed-size stack zone divided into pages, each page being capable of holding several method/block activations.  A send establishes a new frame in the current stack page, a return returns to the previous frame.  This eliminates allocation/deallocation of contexts and the moving of receiver and arguments from caller to callee on each send/return.  Contexts are created lazily when an activation needs a context (creating a block, explicit use of thisContext, access to sender when sender is a frame, or linking of stack pages together).  Contexts are either conventional and heap-resident ("single") or "married" and serve as proxies for their corresponding frame or "widowed", meaning that their spouse frame has been returned from (died).  A married context is specially marked (more details in the code) and refers to its frame.  Likewise a married frame is specially marked and refers to its context.

In addition to SmallInteger arithmetic and Floats, the VM supports logic on 32-bit (and 64-bit) PositiveLargeIntegers, thus allowing it to simulate itself much more efficiently than would otherwise be the case.

StackInterpreter and subclasses support multiple memory managers.  Currently there are two.  NewMemoryManager is a slightly refined version of ObjectMemory, and is the memory manager and garbage collector for the original Squeak object representation as described in "Back to the Future The Story of Squeak, A Practical Smalltalk Written in Itself", see http://ftp.squeak.org/docs/OOPSLA.Squeak.html.  Spur is a faster, more regular object representation that is designed for more performance and functionality, and to have a common header format for both 32-bit and 64-bit versions.  You can read about it in SpurMemoryManager's class comment.  There is also a video of a presentation at ESUG 2014 (https://www.youtube.com/watch?v=k0nBNS1aHZ4), along with slides (http://www.slideshare.net/esug/spur-a-new-object-representation-for-cog?related=1).

StackInterpreter is designed toi be subclassed by CoInterpreter et al.  CoInterpreter cooperates with a bytecode to machine-code JIT compiler, for much higher performance

Instance Variables

atCache
	- a small array holding tuples of oop => format,fixedFields,size to speed up at:[put:].  Unused in CoInterpreter

breakLookupClassTag
	- if non-nil, the class tag to break on sends, breaking (calling warning) if there's a match

breakSelector
	- if breakSelectorLength ~= 0, a pointer to a string to compare messageSelector against on send, breaking (calling warning) if there's a match

breakSelectorLength
	- if > 0, breakSelector is checked on each send.  If < 0, breakSelector is checked on each MNU

bytecodeSetSelector
	- if multiple bytecode sets are in use this is the offset (0 or 256) for the current bytecode set

checkAllocFiller
	- a variable used to fill eden to allow checking for overwriting the end of an object

checkedPluginName
	- the oop of a symbol which, when gcmode is GCCheckPrimCall, can check for heap memory leaks after a specific primitive has been called

classByteArrayCompactIndex
	- the compact class index of the class ByteArray, if appropriate

classNameIndex
	- the slot index of name in a class object, used or debug printing, derived from class Array at start-up

currentBytecode
	- the value of the currentBytecode

debugCallbackInvokes
	- a counter used to debug the old (Python) callback support

debugCallbackPath
	- a variable used to hold the path through the new callback support

debugCallbackReturns
	- a counter used to debug the old (Python) callback support; it should match debugCallbackInvokes

deferDisplayUpdates
	- the variable that implements primitive 126, primitiveDeferDisplayUpdates

desiredEdenBytes
	- the desired size of eden, used at image load and snapshot time

desiredNumStackPages
	- the desired number of stack pages, used at image load and snapshot time

displayBits
	- either the first indexable field of the current display object, or the handle of the current display surface

displayDepth
	- pixel depth of the current display object or surface

displayHeight
	- height in pixels of the current display object or surface

displayWidth
	- width in pixels of the current display object or surface

extA
	- if a prefix btecode set, such as SstaV1, is in use, the accumulator for extension A

extB
	- if a prefix btecode set, such as SstaV1, is in use, the accumulator for extension B

externalPrimitiveTable
	- xxxxx

externalPrimitiveTableFirstFreeIndex
	- a small array cacheing the target function pointer for external calls (primitiveExternalCall)

extraFramesToMoveOnOverflow
	- a variable used to prevent thrashing on sends and returns at the end of a page (see overflowedPage)

extraVMMemory
	- in Spur, free heap to be allocated at startup.  In V3, C memory to reserve for malloc at startup (i.e. malloc extraVMMemory, alloc heap, free extraVMMemory)

framePointer
	- the pointer to the current frame when primitives (or in the CoInterpreter, when machine-code <-> interpreter transitions) are invoked (c.f. localFP)

fullScreenFlag
	- true if the system is in full-screen mode

gcSemaphoreIndex
	- if non-zero, the index in the semaphore table of a semaphore to signal after any GC

globalSessionID
	- a non-zero number (derived from the time) identifying the current session

highestRunnableProcessPriority
	- a tide mark in the runnableProcesses array, used to reduce the time spent scanning the array looking for the highest priority runnable process.  This variable is set high when the priority of the highest process is unknown, and set to the highest found when the array is scanned.  Hence most of the time the nused entries in the array are not scanned.

imageFloatsBigEndian
	- true if the order of data in floats is big-endian

imageHeaderFlags
	- the flags stored in the image at load time or to be stored in the image at snapshto time.  These flags identify various options, sich as whether floats are in platfrm order.

inIOProcessEvents
	- true if the system is receiving events in ioProcessEvents, used to avoid recursion when receiuving events via callbacks

instructionPointer
	- the pointer to the current bytecode when primitives (or in the CoInterpreter, when machine-code <-> interpreter transitions) are invoked (c.f. localIP)

interpreterProxy
	- the table of functions used to export interpreter and memory manager functions to plugin primitives

interruptCheckChain
	- if non nil a funciton pointer to be called when a user interrupt event is received, used by plugin primitives to abort long-running calls on interrupt

interruptKeycode
	- the keycode of the event signifying a user interrupt

interruptPending
	- a variable set by ioProcessEvents if a user interrupt is pending

jmpBuf
	- a small array of jmpbufs (for setjmp/longjmp) used to manage returning in the iold (Python) callback support (see suspendedCallbacks et al)

jmpDepth
	- the index of the next free entry in jmpBuf

lastMethodCacheProbeWrite
	- the index of the last write into the method lookup cache, used by primitiveExternalCall to rewrite the method cache entry to call the target function, avoiding going through primitiveExternalCall on every plugin primitive dispatch

lkupClass
	- the implicit class argument to the class hierarchy looup routines such as lookupOrdinarySend

lkupClassTag
	- the implicit class tag argument to message send lookup

localAbsentReceiver
	- Newspeak, the absent receiver in any Newspeak absent receiver send

localAbsentReceiverOrZero
	- Newspeak, if non-zero, the absent receiver in any Newspeak outer absent receiver send

localFP
	- the frame pointer in the fully-inlined interpret routine, hopfully allowing a C compiler to assign localFP to a register variable (c.f. framePointer)

localIP
	- the instruction pointer in the fully-inlined interpret routine, hopfully allowing a C compiler to assign localFP to a register variable (c.f. instructionPointer)

localReturnValue
	- the value being returned in return bytecodes

localSP
	- the stack pointer in the fully-inlined interpret routine, hopfully allowing a C compiler to assign localFP to a register variable (c.f. framePointer)

longRunningPrimitiveCheckMethod
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveCheckSemaphore
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveCheckSequenceNumber
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveGCUsecs
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveSignalUndelivered
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveStartUsecs
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

longRunningPrimitiveStopUsecs
	- a variable used to monitor long-running primtiives via primitiveLongRunningPrimitive

lowcodeCalloutState
	- Lowcode, the state used to marshall an outgoing Lowcode call

maxExtSemTabSizeSet
	- a flag stating whether the maximum size of the external semaphore table has been set or not

metaAccessorDepth
	- Spur, the accessor depth of a primitive being invoked by one of the meta primitive primitives, primitiveDoPrimitiveWithArgs and primitiveDoNamedPrimitiveWithArgs

metaclassNumSlots
	- teh size of a Metaclass instanc, set at startup, used for debug printing

method
	- the oop of the current method

methodCache
	- a small array holding tuples of selector x class => method,functionPointer to speed up message send (avoid class hierarchy search on send)

methodDictLinearSearchLimit
	- a variable used to control searching of method dictionaries.  Dictionaries of size within the limit are searched linearly instead of hashed.  This can be used either to speed up search in small dictionaries or to turn off hashed lookup wen hashing needs to be changed

nativeSP
	- Lowcode, the native (C) stack pointer (?; then why nativeStackPointer?)

nativeStackPointer
	- Lowcode, the native (C) stack pointer (?; then why nativeSP?)

nextPollUsecs
	- if non-zero, the micosecond clock value at which to next poll for events, used to control event polling rate

nextWakeupUsecs
	- if non-zero, the micosecond clock value at which the next delay expires

nsMethodCache
	- Newspeak, a small array hilding tuples of selector x class tag x calling method x privacy code => target method,primitive function,actual receiver, used to speed up Newspeak absent receiver sends

numExtB
	- the number of bytes in extB, used to correctly maintain extB, given that it is unsigned

numStackPages
	- the number of stack pages being used

overflowedPage
	- the stack page that a send last overflowed, used to avoid thrashing on send and return at the end of a stack page (see extraFramesToMoveOnOverflow)

pendingFinalizationSignals
	- a variable used to control signalling the finalizationSemahpore

primitiveAccessorDepthTable
	- Spur, the accessor depths for the iundexed primitives, used to determine how much state to scan loking for forwarders on primitive failure

primitiveFunctionPointer
	- the function pointer (in simulation, the selector symbol) of the current primitive, nil for newMethod if there is no primitive

primitiveTable
	- the table holding the functions (in simulation the selector symbols) for the indexed primitives

savedWindowSize
	- the display size to write into a snapshot.  Avoids writing a zero window size into a snapshot when an image is loaded headless.  

shadowCallStackPointer
	- Lowcode, the shadow stack pointer, used when marshalling Lowcode external calls

showSurfaceFn
	- if non-zero, the function to call to update the display when the current display is a surface

stackLimit
	- the variable marking the end of the current stack page, also used to break out of interpretation to check for events.  When marking the end of a page, it enables a send to create an activation on a new page,  When set so that any send would fail the stack limit check, causes a check for events on stack page overflow

stackPage
	- the current stack page

stackPages
	- the set of stack pages

stackPointer
	- the pointer to the top of stack in the current frame when primitives (or in the CoInterpreter, when machine-code <-> interpreter transitions) are invoked (c.f. localSP)

statCheckForEvents
	- the count of checkForEventsMaybeContextSwitch: calls

statForceInterruptCheck
	- the count of forceInterruptCheck calls

statIOProcessEvents
	- the count of ioProcessEvents calls

statIdleUsecs
	- the count of microseconds at which the system is at idle (a bad idea; this should be replaced by its inverse; asking the OS how long the VM process has been active)

statPendingFinalizationSignals
	- the count of pendingFinalizationSignals

statProcessSwitch
	- the count of process switches

statStackOverflow
	- the count of stack overflows

statStackPageDivorce
	- the cound of stack page divorces (a stack page divorce occurs when a stack page must be freed for use)

suppressHeartbeatFlag
	- a flag controlling whether the heatbeat is in effect; the heartbeat is used to set stackLimit periodically to cause break out to chedck for events (see stackLimit)

suspendedCallbacks
	- a small array holding the processes suspended when the old callback machinery is in use (see jmpBuf et al)

suspendedMethods
	- a small array holding the methods of the processes suspended when the old callback machinery is in use

tempOop
	- if non-zero, an oop that may move during primitive execution

tempOop2
	- if non-zero, an oop that may move during primitive execution

the2ndUnknownShort
	- the value of a field in the image header that is unused in the StackInterpreter but used in the CoInterpreter (and hence to be preserved in snapshots)

theUnknownShort
	- the value of a field in the image header that is unused in the StackInterpreter but used in the CoInterpreter (and hence to be preserved in snapshots)

thisClassIndex
	- the index in a Metaclass of thisClass (the instance of the metaclass) used in debug printing
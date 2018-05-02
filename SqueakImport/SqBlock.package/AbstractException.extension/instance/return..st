*SqBlock-handling
return: returnValue

"When sent within an ANSI handler's handlerBlock,
 resume execution by returning returnValue from the #on:do: send
 which installed the currently active handlerBlock .

 Any ensure: blocks between top of stack and that #on:do:
 will be executed and the stack trimmed back.

 If return would cross a C extension , the _executeEnsuresBelow:
 will execute ensure blocks below the C frame, and
 return: will trim frames below the C frame.

 Generates an error if sent within a legacy handler's handlerBlock.
 or if the return would cross the frame of a C primitive or user action.
"
 self @env0: _executeEnsuresBelow: 1 .
 self _return: returnValue .


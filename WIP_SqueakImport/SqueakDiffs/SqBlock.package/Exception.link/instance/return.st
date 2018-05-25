signaling
return
  "When sent within an ANSI handler's handlerBlock,
 resume execution by returning nil from the #on:do: send
 which installed the currently active handlerBlock .

 Any ensure: blocks between top of stack and that #on:do:
 will be executed and the stack trimmed back.

 Generates an error if sent within a legacy handler's handlerBlock,
 or if the return would cross the frame of a C primitive or user action.
"

  self _executeEnsuresBelow: 1.
  self _return: nil

I represent an independent path of control in the system. This path of control may be stopped (by sending the message suspend) in such a way that it can later be restarted (by sending the message resume). When any one of several paths of control can be advanced, the single instance of ProcessorScheduler named Processor determines which one will actually be advanced partly using the value of priority.

(If anyone ever makes a subclass of Process, be sure to use allSubInstances in anyProcessesAbove:.)

The threadId variable is used by multi-threaded CogVMs to control process-to-thread binding. It's required to be the fourth instance variable. See SmalltalkImage >> #processHasThreadIdInstVar: for further information.

The island and env instance variables are not used by core squeak, but are used by external packages and included here because Monticello cannot handle external instance variables:
island: used by Tweak and Croquet to partition the image into multiple address spaces
env: used by ProcessSpecific to implement per-process variables
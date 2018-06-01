A TimeProfileBrowser is a browser visualizing the runtime profile of an executed Smalltalk block.  It is useful for finding performance bottlenecks in code. When optimizing code it can
be hard to know what methods actually constitute the bulk of the execution time. Is it a few
methods that take very long time to execute or is it perhaps a single method that gets executed a thousand times?

The block is first spied on using a MessageTally instance (which has even more funtionality than used by the TimeProfileBrowser) which samples the block during it's execution and collects the amount of time approximately spent in the methods executed. Then the methods are shown in the browser with their relative execution time in percent.

Example:
TimeProfileBrowser onBlock: [20 timesRepeat:  [Transcript show: 100 factorial printString]]

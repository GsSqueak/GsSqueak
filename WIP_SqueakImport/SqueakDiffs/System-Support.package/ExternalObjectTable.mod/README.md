I'm an enhanced version of JMM's ExternalSemaphoreTable.
I'm responsible for maintaining the externalObjectsArray, which can be found at slot 39 of Smalltalk specialObjectsArray. Manipulating the array directly is highly discouraged.

My services are available via the methods of the "external objects" category of SmalltalkImage.

To register anObject simply use Smalltalk registerExternalObject: anObject. Use #unregisterExternalObject: to unregister it. It your responsibility to always unregister these objects.
If you'd like the create one or more new Semaphores, and register them for external use, then you should use one of #newExternalSemaphore, #newExternalSemaphoreDo: and #newExternalSemaphores:. If you want to unregister more than one external objects at the same time, then #unregisterExternalObjects: is the method you're looking for.

Implementation details:
I maintain a single instance (#current), which can automatically synchronize with externalObjectsArray.
All accesses are protected by the semaphore instance variable.
To ensure fast access, I keep track of the indexes of the external objects in the externalObjectArray in my indexesByObjects IdentityDictionary.
To ensure fast insertion, I keep track of the free slots of the externalObjectsArray in the freeSlotIndexes OrderedCollection. The access pattern is LIFO to avoid unnecessary growth and reordering of the OrderedCollection.
I can grow the externalObjectsArray (see #ensureFreeSlot), but I never shrink it.
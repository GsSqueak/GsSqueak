*System-Change Notification-events
actionsWithReceiver: anObject forEvent: anEventSelector

	^(self actionSequenceForEvent: anEventSelector)
                select: [:anAction | anAction receiver == anObject ]
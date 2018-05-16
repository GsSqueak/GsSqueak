accessing
randomStream
    RandomStream ifNil: [
        RandomStream := Random new ].
    
    ^ RandomStream

Class {
	#name : 'ARSampleWithFlag',
	#superclass : 'ARSample',
	#category : 'AutoReneraku-Sample',
	#package : 'AutoReneraku-Sample'
}

{ #category : 'tests' }
ARSampleWithFlag >> testOutside [

	| outside |
	self flag: 'We should improve this method'.
	outside := 1 > 2
		           ifTrue: [ 3 ]
		           ifFalse: [ 4 ]
]

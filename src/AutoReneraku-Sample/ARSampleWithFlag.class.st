Class {
	#name : 'ARSampleWithFlag',
	#superclass : 'ARSample',
	#category : 'AutoReneraku-Sample',
	#package : 'AutoReneraku-Sample'
}

{ #category : 'tests' }
ARSampleWithFlag >> testOutside [

	| outside |
	outside := 1 > 2
		           ifTrue: [ 3 ]
		           ifFalse: [ 4 ]
]

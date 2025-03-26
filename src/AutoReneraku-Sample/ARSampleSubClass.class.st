Class {
	#name : 'ARSampleSubClass',
	#superclass : 'ARSample',
	#category : 'AutoReneraku-Sample',
	#package : 'AutoReneraku-Sample'
}

{ #category : 'execution' }
ARSampleSubClass >> testOutside [

	| outside |
	outside := 1 > 2
		           ifTrue: [ 3 ]
		           ifFalse: [ 4 ]
]

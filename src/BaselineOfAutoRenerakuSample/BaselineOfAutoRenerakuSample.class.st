Class {
	#name : 'BaselineOfAutoRenerakuSample',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAutoRenerakuSample',
	#package : 'BaselineOfAutoRenerakuSample'
}

{ #category : 'baselines' }
BaselineOfAutoRenerakuSample >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.

		self definePackages: spec.

		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfAutoRenerakuSample >> defineDependencies: spec [
]

{ #category : 'baselines' }
BaselineOfAutoRenerakuSample >> defineGroups: spec [
]

{ #category : 'baselines' }
BaselineOfAutoRenerakuSample >> definePackages: spec [

	spec
		package: 'AutoReneraku-Sample'
]

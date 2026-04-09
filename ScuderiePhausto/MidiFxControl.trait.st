"
I control an extrernal Analog Heat FX 
"
Trait {
	#name : 'MidiFxControl',
	#instVars : [
		'masterDelayTime',
		'masterDelayAmount',
		'masterResonance',
		'masterCutoff',
		'masterFilterType',
		'midiSender',
		'masterDelayFeedback'
	],
	#category : 'ScuderiePhausto-TurboPhausto',
	#package : 'ScuderiePhausto',
	#tag : 'TurboPhausto'
}

{ #category : 'sweeping' }
MidiFxControl >> cutoffSweepTo: aMIDIValue in: aTimeInseconds [
	"  sweep the value of the selected parameter in a TimeInSeconds - the value is update every 10 milliseconds"

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self masterCutoff.
	range := (startValue max: aMIDIValue) - (startValue min: aMIDIValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
		                       numberOfSteps timesRepeat: [
				                       currentValue := currentValue - step.
				                       self masterCutoffForSweep: currentValue asInteger.
				                       stepDelay wait ] ].
	incrementingProcess := incrementingProcess := [
		                                              numberOfSteps
			                                              timesRepeat: [
					                                              currentValue := currentValue
					                                                              +
					                                                              step.
					                                              self masterCutoff:
						                                              currentValue
							                                              asInteger.
					                                              stepDelay wait ] ].
	startValue < aMIDIValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'sweeping' }
MidiFxControl >> delayAmountTo: aMIDIValue in: aTimeInseconds [

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self masterDelayAmount.
	range := (startValue max: aMIDIValue) - (startValue min: aMIDIValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
		                       numberOfSteps timesRepeat: [
				                       currentValue := currentValue - step.
				                       self masterDelayAmount:
					                       currentValue asInteger.
				                       stepDelay wait ] ].
	incrementingProcess := incrementingProcess := [
		                                              numberOfSteps
			                                              timesRepeat: [
					                                              currentValue := currentValue
					                                                              +
					                                                              step.
					                                              self
						                                              masterDelayAmount:
						                                              currentValue
							                                              asInteger.
					                                              stepDelay wait ] ].
	startValue < aMIDIValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'sweeping' }
MidiFxControl >> delayTimeTo: aMIDIValue in: aTimeInseconds [

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self masterDelayTime.
	range := (startValue max: aMIDIValue) - (startValue min: aMIDIValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
		                       numberOfSteps timesRepeat: [
				                       currentValue := currentValue - step.
				                       self masterDelayTime:
					                       currentValue asInteger.
				                       stepDelay wait ] ].
	incrementingProcess := incrementingProcess := [
		                                              numberOfSteps
			                                              timesRepeat: [
					                                              currentValue := currentValue
					                                                              +
					                                                              step.
					                                              self
						                                              masterDelayTime:
						                                              currentValue
							                                              asInteger.
					                                              stepDelay wait ] ].
	startValue < aMIDIValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'accessing' }
MidiFxControl >> masterCutoff [

	^ masterCutoff
]

{ #category : 'setting' }
MidiFxControl >> masterCutoff: aMIDIValue [

	self midiSender sendCC: 22 withValue: aMIDIValue onChannel: 15.
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterCutoffForSweep: aMIDIValue [

	self midiSender sendCC: 22 withValue: aMIDIValue onChannel: 15.

]

{ #category : 'accessing' }
MidiFxControl >> masterDelayAmount [

	^ masterDelayAmount
]

{ #category : 'setting' }
MidiFxControl >> masterDelayAmount: aMIDIValue [

	self midiSender sendCC: 113 withValue: aMIDIValue onChannel: 16.
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayAmountForSweep: aMIDIValue [

	self midiSender sendCC: 113 withValue: aMIDIValue onChannel: 16.

]

{ #category : 'setting' }
MidiFxControl >> masterDelayFeedback: aMIDIValue [

	self midiSender sendCC: 110 withValue: aMIDIValue onChannel: 16.
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayFeedbackForSweep: aMIDIValue [

	self midiSender sendCC: 110 withValue: aMIDIValue onChannel: 16
]

{ #category : 'accessing' }
MidiFxControl >> masterDelayTime [

	^ masterDelayTime
]

{ #category : 'setting' }
MidiFxControl >> masterDelayTime: aMIDIValue [

	self midiSender sendCC: 107 withValue: aMIDIValue onChannel: 16.
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayTimeForSweep: aMIDIValue [

	self midiSender sendCC: 107 withValue: aMIDIValue onChannel: 16
]

{ #category : 'accessing' }
MidiFxControl >> masterFilterType [

	^ masterFilterType
]

{ #category : 'setting' }
MidiFxControl >> masterFilterType: aFilterType [

	| filterTypes filterType  |
	filterTypes := Dictionary new.
	filterTypes
		add: #lp -> 1;
		add: #bp -> 5;
		add: #hp -> 9.
	filterType := filterTypes at: aFilterType ifAbsent: 1.
	self midiSender sendCC: 30 withValue: filterType onChannel: 15.
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterFilterTypeForSweep: aFilterType [

	| filterTypes filterType |
	filterTypes := Dictionary new.
	filterTypes
		add: #lp -> 1;
		add: #bp -> 5;
		add: #hp -> 9.
	filterType := filterTypes at: aFilterType ifAbsent: 1.
	self midiSender sendCC: 30 withValue: filterType onChannel: 15
]

{ #category : 'accessing' }
MidiFxControl >> masterResonance [

	^ masterResonance
]

{ #category : 'setting' }
MidiFxControl >> masterResonance: aMIDIValue [

	self midiSender sendCC: 23 withValue: aMIDIValue onChannel: 15.

]

{ #category : 'sweeping' }
MidiFxControl >> masterResonanceForSweep: aMIDIValue [

	self midiSender sendCC: 23 withValue: aMIDIValue onChannel: 15
]

{ #category : 'accessing' }
MidiFxControl >> midiSender [ 
 
^ midiSender
]

{ #category : 'accessing' }
MidiFxControl >> midiSender: aMidiSender [

midiSender := aMidiSender 

	
]

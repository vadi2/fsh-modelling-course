// Basic Profiles for Teaching Fundamentals

// Simple profile demonstrating basic constraints
Profile: BasicAnimal
Parent: Patient
Id: basic-animal
Title: "Basic Animal (Teaching Example)"
Description: "A simplified animal profile for teaching basic FSH concepts"
* ^status = #active
* ^experimental = false

// Method 1: Required standard extension
* extension contains http://hl7.org/fhir/StructureDefinition/patient-animal named animal 1..1

// Configure the standard animal extension
* extension[animal].extension[species] 1..1
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)

// Method 2: Cardinality constraints
* active 1..1
* gender 1..1
* name 0..0
* telecom 0..0

// Method 3: Fixed values
* active = true

// Method 4: Datatype constraints
* photo 0..3

// Method 5: Reference constraints
* generalPractitioner only Reference(Practitioner)

// Method 6: Must Support flags
* gender MS
* birthDate MS
* photo MS

// Method 7: Short descriptions for teaching
* gender ^short = "Animal's biological sex"
* birthDate ^short = "When the animal was born"
* photo ^short = "Pictures of the animal"

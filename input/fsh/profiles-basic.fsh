// Basic Profiles for Teaching Fundamentals

// Simple profile demonstrating basic constraints
Profile: BasicAnimal
Parent: Patient
Id: basic-animal
Title: "Basic Animal (Teaching Example)"
Description: "A simplified animal profile for teaching basic FSH concepts"
* ^status = #active
* ^experimental = false

// Method 1: Required extension
* extension contains AnimalSpecies named species 1..1

// Method 2: Cardinality constraints
* active 1..1 // Make required
* gender 1..1 // Make required
* name 0..0 // Remove entirely
* telecom 0..0 // Remove entirely

// Method 3: Fixed values
* active = true

// Method 4: Datatype constraints
* photo 0..3 // Limit to 3 photos max

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

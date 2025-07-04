// Profiles for FSH Modelling Course - Animal Registry

// Main Animal Profile based on Patient
Profile: Animal
Parent: Patient
Id: animal
Title: "Animal"
Description: "A profile representing an animal in the registry system"
* ^status = #active
* ^experimental = false

// Mix of standard and custom extensions
* extension contains
    http://hl7.org/fhir/StructureDefinition/patient-animal named animal 1..1 and
    AnimalCaregiver named caregiver 0..* and
    RescueDate named rescueDate 0..1 and
    Neutered named neutered 0..1 and
    VeterinaryHistory named veterinaryHistory 0..1

// Configure the standard animal extension
* extension[animal].extension[species] 1..1
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)
* extension[animal].extension[breed] 0..1
* extension[animal].extension[breed].valueCodeableConcept from AnimalBreedsVS (preferred)
* extension[animal].extension[genderStatus] 0..1

// Constrain Patient fields for animals
* active 1..1
* active = true
* gender 1..1
* birthDate 0..1
* deceased[x] 0..1
* multipleBirth[x] 0..1
* photo 0..*
* generalPractitioner 0..*

// Add constraints with explanations
* gender ^short = "Animal sex"
* gender ^definition = "The biological sex of the animal"
* birthDate ^short = "Animal birth date"
* birthDate ^definition = "The date of birth of the animal, if known"
* photo ^short = "Animal photos"
* photo ^definition = "Photographs of the animal for identification"
* generalPractitioner ^short = "Veterinarian"
* generalPractitioner ^definition = "Reference to the animal's veterinarian(s)"
* generalPractitioner only Reference(Practitioner)
* managingOrganization ^short = "Managing organization"
* managingOrganization ^definition = "The organization responsible for the animal (shelter, clinic, etc.)"

// Specialized profiles for different animal types
Profile: DomesticAnimal
Parent: Animal
Id: domestic-animal
Title: "Domestic Animal"
Description: "A profile for domestic animals (pets)"
* ^status = #active
* ^experimental = false

* extension[animal].extension[species].valueCodeableConcept from DomesticAnimalsVS (required)
* extension[caregiver] 1..*
* extension[neutered] 1..1
* generalPractitioner 1..*

Profile: WildlifeAnimal
Parent: Animal
Id: wildlife-animal
Title: "Wildlife Animal"
Description: "A profile for wildlife animals in conservation or rehabilitation"
* ^status = #active
* ^experimental = false

* modifierExtension contains EndangeredStatus named endangeredStatus 0..1
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)
* extension[rescueDate] 1..1

* extension contains animal-characteristics named characteristics 0..1
* extension[characteristics].extension[microchipId] 1..1
* managingOrganization 1..1

// Profile for animals in veterinary care
Profile: VeterinaryPatient
Parent: Animal
Id: veterinary-patient
Title: "Veterinary Patient"
Description: "An animal currently receiving veterinary care"
* ^status = #active
* ^experimental = false

* extension[veterinaryHistory] 1..1
* generalPractitioner 1..1
* active = true

// Constraint examples with invariants
Profile: AnimalWithValidation
Parent: Animal
Id: animal-with-validation
Title: "Animal with Validation Rules"
Description: "Demonstrates custom validation rules for animals"
* ^status = #active
* ^experimental = false

* obeys animal-birth-date-valid

Invariant: animal-birth-date-valid
Description: "Animal birth date cannot be in the future"
Expression: "birthDate.empty() or birthDate <= today()"
Severity: #error

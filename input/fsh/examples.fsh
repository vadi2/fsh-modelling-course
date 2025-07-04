// Examples for FSH Modelling Course - Animal Registry

// Example: Simple basic animal
Instance: SimpleAnimalExample
InstanceOf: BasicAnimal
Title: "Simple Animal Example"
Description: "A minimal example with basic concepts"
* active = true
* gender = #female
* birthDate = "2023-06-01"

// Just the required standard extension
* extension[animal].extension[species].valueCodeableConcept = $AnimalTypesCS#rabbit "Rabbit"

* photo[0].contentType = #image/jpeg
* photo[0].title = "Simple rabbit photo"

// Weight observation for simple animal
Instance: SimpleAnimalWeightObservation
InstanceOf: Observation
Title: "Simple Animal Weight"
Description: "Weight observation for the simple rabbit"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(SimpleAnimalExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 2.1 'kg' "kg"

// Example: Basic domestic dog
Instance: BuddyTheGoldenRetriever
InstanceOf: DomesticAnimal
Title: "Buddy - Golden Retriever"
Description: "A typical pet dog registration example"
* active = true
* gender = #male
* birthDate = "2020-03-15"
* name.text = "Buddy"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = $AnimalTypesCS#dog "Dog"
* extension[animal].extension[breed].valueCodeableConcept = $AnimalBreedsCS#golden-retriever "Golden Retriever"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#neutered "Neutered"

* extension[neutered].valueBoolean = true
* extension[caregiver].valueReference = Reference(JohnSmithOwner)

// Veterinarian
* generalPractitioner = Reference(DrVetSmith)

// Weight observation for Buddy
Instance: BuddyWeightObservation
InstanceOf: Observation
Title: "Buddy's Weight"
Description: "Current weight observation for Buddy"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(BuddyTheGoldenRetriever)
* effectiveDateTime = "2024-01-20"
* valueQuantity = 32 'kg' "kg"
* performer = Reference(DrVetSmith)

// Example: Rescued cat
Instance: WhiskersThePersian
InstanceOf: DomesticAnimal
Title: "Whiskers - Persian Cat"
Description: "A rescued Persian cat with medical history"
* active = true
* gender = #female
* birthDate = "2019-07-22"
* name.text = "Whiskers"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = $AnimalTypesCS#cat "Cat"
* extension[animal].extension[breed].valueCodeableConcept = $AnimalBreedsCS#persian "Persian"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#intact "Intact"

* extension[rescueDate].valueDate = "2023-01-10"
* extension[neutered].valueBoolean = false
* extension[caregiver].valueReference = Reference(AnimalShelter)

// Veterinary history
* extension[veterinaryHistory].extension[lastCheckup].valueDate = "2024-01-15"
* extension[veterinaryHistory].extension[vaccinations].valueString = "FVRCP current, rabies due 2024-07-22"
* extension[veterinaryHistory].extension[chronicConditions].valueString = "Mild kidney disease"
* extension[veterinaryHistory].extension[allergies].valueString = "Chicken protein"
* extension[veterinaryHistory].extension[medications].valueString = "Kidney support supplement daily"

* generalPractitioner = Reference(DrVetJones)
* managingOrganization = Reference(AnimalShelter)

// Weight observation for Whiskers
Instance: WhiskersWeightObservation
InstanceOf: Observation
Title: "Whiskers' Weight"
Description: "Current weight observation for Whiskers"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(WhiskersThePersian)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 4.2 'kg' "kg"
* performer = Reference(DrVetJones)

// Example: Wildlife animal
Instance: EagleInRehab
InstanceOf: WildlifeAnimal
Title: "Bald Eagle in Rehabilitation"
Description: "An endangered bald eagle in wildlife rehabilitation"
* active = true
* gender = #female
* birthDate = "2022-05-01"
* name.text = "Liberty"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = $AnimalTypesCS#wildlife "Wildlife"

// Custom extensions
* extension[rescueDate].valueDate = "2023-08-15"
* modifierExtension[endangeredStatus].valueCodeableConcept = $ConservationStatusCS#NT "Near Threatened"

// Veterinary history for rehabilitation
* extension[veterinaryHistory].extension[lastCheckup].valueDate = "2024-01-20"
* extension[veterinaryHistory].extension[chronicConditions].valueString = "Wing fracture - healing well"
* extension[veterinaryHistory].extension[medications].valueString = "Pain management as needed"

* generalPractitioner = Reference(DrWildlifeVet)
* managingOrganization = Reference(WildlifeRehabCenter)

// Example: Veterinary patient
Instance: MaxInTreatment
InstanceOf: VeterinaryPatient
Title: "Max - Dog in Treatment"
Description: "A dog currently receiving veterinary treatment"
* active = true
* gender = #male
* birthDate = "2021-11-03"
* name.text = "Max"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = $AnimalTypesCS#dog "Dog"
* extension[animal].extension[breed].valueCodeableConcept = $AnimalBreedsCS#mixed-dog "Mixed Breed Dog"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#neutered "Neutered"

// Required for veterinary patient
* extension[neutered].valueBoolean = true

// Complete veterinary history
* extension[veterinaryHistory].extension[lastCheckup].valueDate = "2024-01-25"
* extension[veterinaryHistory].extension[vaccinations].valueString = "All current - DHPP, rabies, bordetella"
* extension[veterinaryHistory].extension[chronicConditions].valueString = "Hip dysplasia"
* extension[veterinaryHistory].extension[allergies].valueString = "Beef, environmental allergens"
* extension[veterinaryHistory].extension[medications].valueString = "Joint supplement, antihistamine PRN"

* extension[caregiver].valueReference = Reference(FamilyCaregiver)
* generalPractitioner = Reference(DrVetSmith)



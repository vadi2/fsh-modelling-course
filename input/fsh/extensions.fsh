// Extensions for FSH Modelling Course - Animal Registry

// ExampleSimple extension with CodeableConcept
Extension: AnimalSpecies
Id: animal-species
Title: "Animal Species"
Description: "The specific species of the animal"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept from $AnimalTypesVS (required)


// ExampleComplex extension with multiple sub-extensions
Extension: AnimalCharacteristics
Id: animal-characteristics
Title: "Animal Physical Characteristics"
Description: "Physical characteristics and attributes of the animal"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* extension contains
    breed 0..1 and
    color 0..* and
    size 0..1 and
    markings 0..1 and
    microchipId 0..1

* extension[breed] ^short = "Animal breed"
* extension[breed] ^definition = "The breed of the animal"
* extension[breed].value[x] only CodeableConcept
* extension[breed].valueCodeableConcept from $AnimalBreedsVS (preferred)

* extension[color] ^short = "Animal color(s)"
* extension[color] ^definition = "Primary and secondary colors of the animal"
* extension[color].value[x] only string

* extension[markings] ^short = "Distinctive markings"
* extension[markings] ^definition = "Description of any distinctive markings or patterns"
* extension[markings].value[x] only string

* extension[microchipId] ^short = "Microchip identification"
* extension[microchipId] ^definition = "Microchip identification number if present"
* extension[microchipId].value[x] only string

// ExampleModifier extension (changes meaning of the resource)
Extension: EndangeredStatus
Id: endangered-status
Title: "Endangered Status (modifier)"
Description: "Conservation status that may affect how the animal is handled"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* . ^isModifier = true
* . ^isModifierReason = "Indicates the animal is under special conservation measures"
* value[x] only CodeableConcept
* valueCodeableConcept from $ConservationStatusVS (required)

// ExampleExtension with Reference datatype
Extension: AnimalCaregiver
Id: animal-caregiver
Title: "Animal Caregiver"
Description: "Reference to the primary caregiver or owner of the animal"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only Reference(Practitioner or RelatedPerson or Organization)

// ExampleExtension with date
Extension: RescueDate
Id: rescue-date
Title: "Animal Rescue Date"
Description: "Date when the animal was rescued or taken into care"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only date

// ExampleExtension with boolean
Extension: Neutered
Id: neutered
Title: "Neutered Status"
Description: "Whether the animal has been spayed or neutered"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only boolean

// ExampleNested complex extension
Extension: VeterinaryHistory
Id: veterinary-history
Title: "Veterinary History"
Description: "Summary of veterinary care and medical history"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "Patient"
* extension contains
    lastCheckup 0..1 and
    vaccinations 0..1 and
    chronicConditions 0..* and
    allergies 0..* and
    medications 0..*

* extension[lastCheckup] ^short = "Last veterinary checkup date"
* extension[lastCheckup].value[x] only date

* extension[vaccinations] ^short = "Vaccination status"
* extension[vaccinations].value[x] only string

* extension[chronicConditions] ^short = "Chronic medical conditions"
* extension[chronicConditions].value[x] only string

* extension[allergies] ^short = "Known allergies"
* extension[allergies].value[x] only string

* extension[medications] ^short = "Current medications"
* extension[medications].value[x] only string

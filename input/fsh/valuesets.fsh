// ValueSets for FSH Modelling Course - Animal Registry

// Method 1: Simple inclusion of entire CodeSystem
ValueSet: AnimalTypesVS
Id: animal-types
Title: "Animal Types"
Description: "All animal types available in the registry"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalTypes

// Method 2: Selective inclusion with specific codes
ValueSet: DomesticAnimalsVS
Id: domestic-animals
Title: "Domestic Animals"
Description: "Common domestic animals suitable for household pets"
* ^status = #active
* ^experimental = false
* include $AnimalTypes#dog
* include $AnimalTypes#cat
* include $AnimalTypes#bird
* include $AnimalTypes#rabbit
* include $AnimalTypes#hamster
* include $AnimalTypes#fish

// Method 3: Exclusion pattern - include all except specific codes
ValueSet: NonWildlifeAnimalsVS
Id: non-wildlife-animals
Title: "Non-Wildlife Animals"
Description: "All animal types except wildlife"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalTypes
* exclude $AnimalTypes#wildlife

// Method 4: Dog breeds only - filtered inclusion
ValueSet: DogBreedsVS
Id: dog-breeds
Title: "Dog Breeds"
Description: "Available dog breeds in the registry"
* ^status = #active
* ^experimental = false
* include $AnimalBreeds#golden-retriever
* include $AnimalBreeds#labrador
* include $AnimalBreeds#german-shepherd
* include $AnimalBreeds#bulldog
* include $AnimalBreeds#poodle
* include $AnimalBreeds#mixed-dog

// Method 5: Cat breeds only
ValueSet: CatBreedsVS
Id: cat-breeds
Title: "Cat Breeds"
Description: "Available cat breeds in the registry"
* ^status = #active
* ^experimental = false
* include $AnimalBreeds#persian
* include $AnimalBreeds#siamese
* include $AnimalBreeds#maine-coon
* include $AnimalBreeds#british-shorthair
* include $AnimalBreeds#mixed-cat

// Method 6: All breeds - entire CodeSystem inclusion
ValueSet: AllAnimalBreedsVS
Id: all-animal-breeds
Title: "All Animal Breeds"
Description: "Complete list of all animal breeds in the registry"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalBreeds

// Method 7: Conservation status with grouping
ValueSet: ThreatenedSpeciesVS
Id: threatened-species
Title: "Threatened Species"
Description: "Conservation statuses indicating species are at risk"
* ^status = #active
* ^experimental = false
* include $ConservationStatus#NT "Near Threatened"
* include $ConservationStatus#VU "Vulnerable"
* include $ConservationStatus#EN "Endangered"
* include $ConservationStatus#CR "Critically Endangered"

// Method 8: Complete conservation status
ValueSet: ConservationStatusVS
Id: conservation-status
Title: "Conservation Status"
Description: "All IUCN conservation status categories"
* ^status = #active
* ^experimental = false
* include codes from system $ConservationStatus

// Method 9: Mixed inclusion with external codes
ValueSet: AnimalIdentificationVS
Id: animal-identification
Title: "Animal Identification Methods"
Description: "Methods for identifying animals, combining local and external codes"
* ^status = #active
* ^experimental = false
// Local concepts
* include $AnimalTypes#dog "Dog identification"
* include $AnimalTypes#cat "Cat identification"
// External SNOMED codes (examples)
* include $sct#397745006 "Medical identification tag"
* include $sct#261665006 "Unknown identification"

// Method 10: Compose from multiple systems
ValueSet: AnimalRegistryConceptsVS
Id: animal-registry-concepts
Title: "Animal Registry Core Concepts"
Description: "Key concepts used throughout the animal registry system"
* ^status = #active
* ^experimental = false
* ^compose.include[0].system = $AnimalTypes
* ^compose.include[0].concept[0].code = #dog
* ^compose.include[0].concept[1].code = #cat
* ^compose.include[1].system = $ConservationStatus
* ^compose.include[1].concept[0].code = #EN
* ^compose.include[1].concept[1].code = #CR

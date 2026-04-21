// ValueSets for FSH Modelling Course - Animal Registry

// Simple inclusion of entire CodeSystem
ValueSet: AnimalTypesVS
Id: animal-types-vs
Title: "Animal Types"
Description: "All animal types available in the registry"
* ^status = #active
* ^experimental = false
* include codes from system AnimalTypesCS

// Selective inclusion with specific codes
ValueSet: DomesticAnimalsVS
Id: domestic-animals-vs
Title: "Domestic Animals"
Description: "Common domestic animals suitable for household pets"
* ^status = #active
* ^experimental = false
* include AnimalTypesCS#dog
* include AnimalTypesCS#cat
* include AnimalTypesCS#bird
* include AnimalTypesCS#rabbit
* include AnimalTypesCS#fish

// Exclusion pattern - include all except specific codes
ValueSet: NonWildlifeAnimalsVS
Id: non-wildlife-animals-vs
Title: "Non-Wildlife Animals"
Description: "All animal types except wildlife"
* ^status = #active
* ^experimental = false
* include codes from system AnimalTypesCS
* exclude AnimalTypesCS#wildlife

// Dog breeds only - filtered inclusion
ValueSet: DogBreedsVS
Id: dog-breeds-vs
Title: "Dog Breeds"
Description: "Available dog breeds in the registry"
* ^status = #active
* ^experimental = false
* include AnimalBreedsCS#golden-retriever
* include AnimalBreedsCS#labrador
* include AnimalBreedsCS#german-shepherd
* include AnimalBreedsCS#bulldog
* include AnimalBreedsCS#poodle
* include AnimalBreedsCS#mixed-dog

// Cat breeds only
ValueSet: CatBreedsVS
Id: cat-breeds-vs
Title: "Cat Breeds"
Description: "Available cat breeds in the registry"
* ^status = #active
* ^experimental = false
* include AnimalBreedsCS#persian
* include AnimalBreedsCS#siamese
* include AnimalBreedsCS#maine-coon
* include AnimalBreedsCS#british-shorthair
* include AnimalBreedsCS#mixed-cat

// All breeds - entire CodeSystem inclusion
ValueSet: AnimalBreedsVS
Id: animal-breeds-vs
Title: "All Animal Breeds"
Description: "Complete list of all animal breeds in the registry"
* ^status = #active
* ^experimental = false
* include codes from system AnimalBreedsCS

// Mixed inclusion with external codes
ValueSet: AnimalIdentificationVS
Id: animal-identification-vs
Title: "Animal Identification Methods"
Description: "Methods for identifying animals, combining local and external codes"
* ^status = #active
* ^experimental = false
// Local concepts
* include AnimalTypesCS#dog "Dog identification"
* include AnimalTypesCS#cat "Cat identification"
// External SNOMED codes (examples)
* include $sct#38472000 "Medical identification tag"
* include $sct#261665006 "Unknown identification"

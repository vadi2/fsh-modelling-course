# FSH Modelling Course - Animal Registry

This is a teaching project that demonstrates FSH (FHIR Shorthand) fundamentals using an animal registry system as the domain.

## Project Structure

- `input/fsh/` - Contains all FSH files (profiles, extensions, examples, etc.)
- `input/pagecontent/` - Contains markdown files for the IG narrative
- `sushi-config.yaml` - Main configuration file

## Building the IG

To build this implementation guide:

1. Install SUSHI: `npm install -g fsh-sushi`
2. Run SUSHI: `sushi .`
3. Run IG Publisher: `_genonce.sh` (or `_genonce.bat` on Windows)

## Course Modules

This project demonstrates:
- CodeSystems and ValueSets
- Extensions (simple and complex)
- Profiles with constraints
- Examples and instances
- Invariants and validation
- Implementation Guide creation

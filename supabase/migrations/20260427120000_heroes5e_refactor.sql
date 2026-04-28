-- Migration to refactor Pokémon tables for heroes, manga, and anime characters

-- Rename 'pokemon' table to 'characters'
ALTER TABLE pokemon RENAME TO characters;

-- Rename 'pokemon_id' to 'character_id' in 'moves' table
ALTER TABLE moves RENAME COLUMN pokemon_id TO character_id;

-- Rename 'moves' table to 'abilities'
ALTER TABLE moves RENAME TO abilities;

-- Add new columns and rename existing columns in 'abilities' table
ALTER TABLE abilities 
ADD COLUMN origin TEXT[], 
RENAME COLUMN ability TO signature_power, 
RENAME COLUMN type TO origins, 
RENAME COLUMN nature TO personality_archetype, 
RENAME COLUMN species TO character_name, 
RENAME COLUMN tera_type TO powered_form, 
RENAME COLUMN is_shiny TO has_alternate_form;

-- Note: Update all stored procedures to use new table/column names manually.
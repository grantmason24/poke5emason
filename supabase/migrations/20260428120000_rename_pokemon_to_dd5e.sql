-- Migration file for renaming pokemon-related tables and columns to support D&D 5e character system

-- Rename `pokemon` table to `characters`
ALTER TABLE pokemon RENAME TO characters;

-- Rename `trainer_id` to `player_id` in `characters` table
ALTER TABLE characters RENAME COLUMN trainer_id TO player_id;

-- Rename `trainer` references to `player`
UPDATE characters SET player_id = (SELECT player_id FROM players WHERE players.id = characters.player_id);

-- Rename `species` to `character_name`
ALTER TABLE characters RENAME COLUMN species TO character_name;

-- Rename `type` column to `origin`
ALTER TABLE characters RENAME COLUMN type TO origin;

-- Rename `nature` to `personality_archetype`
ALTER TABLE characters RENAME COLUMN nature TO personality_archetype;

-- Rename `ability` to `signature_power`
ALTER TABLE characters RENAME COLUMN ability TO signature_power;

-- Rename `tera_type` to `powered_form`
ALTER TABLE characters RENAME COLUMN tera_type TO powered_form;

-- Rename `is_shiny` to `has_alternate_form`
ALTER TABLE characters RENAME COLUMN is_shiny TO has_alternate_form;

-- Rename `moves` table to `abilities`
ALTER TABLE moves RENAME TO abilities;

-- Rename `move_id` to `ability_id` in `abilities` table
ALTER TABLE abilities RENAME COLUMN move_id TO ability_id;

-- Rename `pp_cur` to `uses_remaining`
ALTER TABLE abilities RENAME COLUMN pp_cur TO uses_remaining;

-- Rename `pp_max` to `uses_per_day`
ALTER TABLE abilities RENAME COLUMN pp_max TO uses_per_day;

-- Update all stored procedures and functions to use new naming conventions
-- (This will require additional commands based on what stored procedures exist)

-- Create new players table to replace trainers
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(255) NOT NULL,
    source_material VARCHAR(255),
    character_universe VARCHAR(255)
);

-- You may want to alter table constraints, indices, or foreign keys if needed

-- Keeping all D&D 5e mechanics intact
-- (Ensure ability scores, skills, feats, etc., are preserved in other relevant tables)

-- Additional commands to adjust for D&D populations and mechanics will be placed here.
-- Migration SQL to rename all Pokemon-related tables and columns to character-related terminology for D&D 5e mechanics.

-- Example renaming: 
-- 1. `pokemon` table to `characters`
-- 2. `trainer` column to `player`
-- 3. `type` column to `class`

ALTER TABLE pokemon RENAME TO characters;
ALTER TABLE characters RENAME COLUMN trainer TO player;
ALTER TABLE characters RENAME COLUMN type TO class;
ALTER TABLE characters RENAME COLUMN level TO experience_level;

-- Add more renames as necessary for your schema.

-- Make sure to update any foreign key relationships, indexes, and references to maintain database integrity.
-- This migration should preserve all existing data while updating the schema accordingly.
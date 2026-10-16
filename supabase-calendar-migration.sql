-- Safe, non-destructive additions for the todo calendar.
-- Run once in the Supabase SQL Editor for project jwgwvbflfdqwuebbrvhm.
ALTER TABLE public.todos
  ADD COLUMN IF NOT EXISTS deadline date,
  ADD COLUMN IF NOT EXISTS completed_by text,
  ADD COLUMN IF NOT EXISTS completed_at timestamptz;

-- Keep the created timestamp populated for existing and new tasks.
UPDATE public.todos
SET created_at = now()
WHERE created_at IS NULL;

ALTER TABLE public.todos
  ALTER COLUMN created_at SET DEFAULT now();

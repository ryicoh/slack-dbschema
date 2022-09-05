CREATE TABLE IF NOT EXISTS public.workspace
(
  workspace_id uuid PRIMARY KEY,
  name VARCHAR(128) UNIQUE NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT now()
);

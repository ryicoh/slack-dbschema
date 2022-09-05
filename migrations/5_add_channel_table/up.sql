CREATE TABLE IF NOT EXISTS public.channel
(
  channel_id uuid PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  workspace_id uuid NOT NULL REFERENCES public.workspace(workspace_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL DEFAULT now(),
  UNIQUE (name, workspace_id)
);

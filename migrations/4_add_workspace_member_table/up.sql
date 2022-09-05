CREATE TABLE IF NOT EXISTS public.workspace_member
(
  workspace_id uuid NOT NULL REFERENCES public.workspace(workspace_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES public.user(user_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (workspace_id, user_id)
);

CREATE TABLE IF NOT EXISTS public.channel_member
(
  channel_id uuid NOT NULL REFERENCES public.channel(channel_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES public.user(user_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (channel_id, user_id)
);

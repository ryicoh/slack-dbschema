CREATE TABLE IF NOT EXISTS public.channel_message
(
  channel_message_id uuid PRIMARY KEY,
  channel_id uuid NOT NULL REFERENCES public.channel(channel_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES public.user(user_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  is_thread boolean DEFAULT false,
  message VARCHAR(8192) NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT now()
);

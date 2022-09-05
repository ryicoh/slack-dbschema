CREATE TABLE IF NOT EXISTS public.thread_message
(
  thread_message_id uuid PRIMARY KEY,
  channel_message_id uuid NOT NULL REFERENCES public.channel_message(channel_message_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  message VARCHAR(8192) NOT NULL,
  user_id uuid NOT NULL REFERENCES public.user(user_id) ON UPDATE RESTRICT ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL DEFAULT now()
);

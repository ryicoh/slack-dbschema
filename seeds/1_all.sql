CREATE OR REPLACE FUNCTION public.gen_random_uuid()
RETURNS uuid
LANGUAGE c
PARALLEL SAFE
AS '$libdir/pgcrypto', $function$pg_random_uuid$function$;

DO $$
  DECLARE
  userID uuid;
  workspaceID uuid;
  channelID uuid;
  channelMessageID uuid;
  begin
    for o_idx in 1..10000 loop
      workspaceID := gen_random_uuid();
      insert into public.workspace(workspace_id, name) values(workspaceID, concat ('workspace_name_', o_idx));

      for c_idx in 1..10 loop
        channelID := gen_random_uuid();
        insert into public.channel(channel_id, workspace_id, name) values(channelID, workspaceID, concat ('channel_name_', c_idx));
        for u_idx in 1..10 loop
          userID := gen_random_uuid();
          insert into public.user(user_id, name) values(userID, concat ('workspace_', o_idx, 'chan_', c_idx, u_idx));
          insert into public.workspace_member(user_id, workspace_id) values(userID, workspaceID);
          insert into public.channel_member(user_id, channel_id) values(userID, channelID);
          for m_idx in 1..10 loop
            channelMessageID := gen_random_uuid();
            insert into public.channel_message(channel_message_id, channel_id, user_id, is_thread, message) values(channelMessageID, channelID, userID, true, concat('chan_',c_idx, '_chan_msg_', m_idx));
            insert into public.thread_message(thread_message_id, channel_message_id, user_id, message) values(gen_random_uuid(), channelMessageID, userID, concat('chan_',c_idx, '_thre_msg_', m_idx));
          end loop;
        end loop;
      end loop;
    end loop;
  end;
  $$;

DROP FUNCTION IF EXISTS public.gen_random_uuid()

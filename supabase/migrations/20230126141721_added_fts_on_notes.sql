alter table "public"."notes" add column "fts" tsvector generated always as (to_tsvector('english'::regconfig, ((title || ' '::text) || body))) stored;

CREATE INDEX notes_fts ON public.notes USING gin (fts);



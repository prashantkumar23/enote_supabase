alter table "public"."profiles" add column "interval" text;

alter table "public"."profiles" add column "isSubscribed" boolean;

alter table "public"."profiles" add column "plan" text;

alter table "public"."profiles" add column "stripe_customer" text default ''::text;

CREATE UNIQUE INDEX profiles_stripe_customer_key ON public.profiles USING btree (stripe_customer);

alter table "public"."profiles" add constraint "profiles_stripe_customer_key" UNIQUE using index "profiles_stripe_customer_key";



-- This script was generated by the Schema Diff utility in pgAdmin 4
-- For the circular dependencies, the order in which Schema Diff writes the objects is not very sophisticated
-- and may require manual changes to the script to ensure changes are applied in the correct order.
-- Please report an issue for any failure with the reproduction steps.

CREATE POLICY "Enable user to delete their profile only if authenticated"
    ON public.profiles
    AS PERMISSIVE
    FOR DELETE
    TO authenticated
    USING ((auth.uid() = id));

CREATE POLICY "Enable user to update their profile only if authenticated"
    ON public.profiles
    AS PERMISSIVE
    FOR UPDATE
    TO authenticated
    USING ((auth.uid() = id))
    WITH CHECK ((auth.uid() = id));


CREATE POLICY "Enable user to read their profile only if authenticated"
    ON public.profiles
    AS PERMISSIVE
    FOR SELECT
    TO authenticated
    USING ((auth.uid() = id));

CREATE POLICY "Enable all action for auth users only "
    ON public.notes
    AS PERMISSIVE
    FOR ALL
    TO authenticated
    USING ((auth.uid() = user_id))
    WITH CHECK ((auth.uid() = user_id));

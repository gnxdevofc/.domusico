-- Antes de executar: substitua ce36cda4-f07d-4a23-8bb0-269b64ad107d pelo User UID
-- da conta criada em Supabase > Authentication > Users.
-- Mantenha as aspas simples e não use este SQL antes de substituir o UID.

grant insert, update on table public.domusico_products to authenticated;

create policy "domusico_admin_insert_only"
on public.domusico_products
for insert
to authenticated
with check ((select auth.uid()) = 'ce36cda4-f07d-4a23-8bb0-269b64ad107d'::uuid);

create policy "domusico_admin_update_only"
on public.domusico_products
for update
to authenticated
using ((select auth.uid()) = 'ce36cda4-f07d-4a23-8bb0-269b64ad107d'::uuid)
with check ((select auth.uid()) = 'ce36cda4-f07d-4a23-8bb0-269b64ad107d'::uuid);

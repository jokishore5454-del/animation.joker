-- Run this once in Supabase SQL Editor.
create table if not exists public.site_media (
  id bigint primary key default 1 check (id = 1),
  music_url text,
  music_title text,
  music_artist text,
  hero_video_url text,
  hero_poster_url text,
  base_image_url text,
  seal_image_url text,
  sage_image_url text,
  updated_at timestamptz default now()
);
insert into public.site_media (id) values (1) on conflict (id) do nothing;
alter table public.site_media enable row level security;

drop policy if exists "public can read site media" on public.site_media;
create policy "public can read site media" on public.site_media for select using (true);

drop policy if exists "authenticated can update site media" on public.site_media;
create policy "authenticated can update site media" on public.site_media for update to authenticated using (true) with check (true);

drop policy if exists "authenticated can insert site media" on public.site_media;
create policy "authenticated can insert site media" on public.site_media for insert to authenticated with check (id = 1);

insert into storage.buckets (id,name,public) values ('itachi-media','itachi-media',true) on conflict (id) do update set public=true;

drop policy if exists "public can view itachi media" on storage.objects;
create policy "public can view itachi media" on storage.objects for select using (bucket_id='itachi-media');

drop policy if exists "authenticated can upload itachi media" on storage.objects;
create policy "authenticated can upload itachi media" on storage.objects for insert to authenticated with check (bucket_id='itachi-media');

drop policy if exists "authenticated can update itachi media" on storage.objects;
create policy "authenticated can update itachi media" on storage.objects for update to authenticated using (bucket_id='itachi-media') with check (bucket_id='itachi-media');

drop policy if exists "authenticated can delete itachi media" on storage.objects;
create policy "authenticated can delete itachi media" on storage.objects for delete to authenticated using (bucket_id='itachi-media');

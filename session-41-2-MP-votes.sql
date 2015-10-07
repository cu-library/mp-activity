-- Query for OpenParliament.ca data download (https://openparliament.ca/data-download/):
-- counts elected member vote absences in parliamentary session 41-2 and
-- associates count with member, riding, and party information.
select
  core_riding.id as fed_id,
  vote_absences.absent_votes,
  vote_absences.member_id,
  core_politician.id as politician_id,
  core_politician.name as name,
  core_riding.name as riding,
  core_party.short_name as party,
  concat('https://openparliament.ca/media/', core_politician.headshot) as image_url
from (
  select
    count(bills_membervote.vote) as absent_votes,
    bills_membervote.member_id
  from
    bills_votequestion,
    bills_membervote
  where bills_votequestion.session_id = '41-2'
    and bills_votequestion.id = bills_membervote.votequestion_id
    and bills_membervote.vote = 'A'
    group by bills_membervote.member_id
    order by count(bills_membervote)
) as vote_absences,
core_electedmember,
core_politician,
core_riding,
core_party
where vote_absences.member_id = core_electedmember.id
and core_electedmember.politician_id = core_politician.id
and core_electedmember.riding_id = core_riding.id
and core_electedmember.party_id = core_party.id

SET TERM ^ ;
CREATE PROCEDURE PROC_CONJOINTS_ORDONNES (
    INDI Integer,
    C_INCONNU Integer )
RETURNS (
    ORDRE Integer,
    CLEF_UNION Integer,
    CONJOINT Integer,
    CLEF_MARR Integer )
AS
BEGIN SUSPEND; END^

ALTER PROCEDURE PROC_CONJOINTS_ORDONNES (
    INDI Integer,
    C_INCONNU Integer )
RETURNS (
    ORDRE Integer,
    CLEF_UNION Integer,
    CONJOINT Integer,
    CLEF_MARR Integer )
AS
begin
  ordre=0;
  for SELECT distinct
      :ordre+1
     ,r.union_clef
     ,r.conjoint
     ,r.clef_marr
  from (select
     u.union_clef
     ,case u.union_mari
        when :indi then u.union_femme
        else u.union_mari
        end as conjoint
     ,(select first(1) ev_fam_clef
       from evenements_fam
       where ev_fam_kle_famille=u.union_clef and ev_fam_type='MARR'
       order by ev_fam_date_year,ev_fam_date) as clef_marr
     ,(select first(1) ev_fam_date_year*372*31+coalesce(extract(day from ev_fam_date)-1,0)
       from evenements_fam
       where ev_fam_kle_famille=u.union_clef and ev_fam_date_year is not null
       order by ev_fam_date_year,ev_fam_date) as date_prem_fam
     ,(select first(1) n.ev_ind_date_year*372*31+coalesce(extract(day from n.ev_ind_date)-1,0)
       from individu e inner join evenements_ind n on n.ev_ind_kle_fiche=e.cle_fiche
       where e.cle_pere is not distinct from u.union_mari
         and e.cle_mere is not distinct from u.union_femme
         and n.ev_ind_date_year is not null
       order by n.ev_ind_date_year,n.ev_ind_date) as date_prem_enf
     ,(select first(1) ev_ind_date_year*372*31+coalesce(extract(day from ev_ind_date)-1,0)
       from evenements_ind
       where ev_ind_kle_fiche=case u.union_mari
                              when :indi then u.union_femme
                              else u.union_mari
                              end
        and ev_ind_date_year is not null
       order by ev_ind_date_year desc,ev_ind_date desc) as date_dern_eve
     FROM t_union u
      left join individu e on e.cle_pere is not distinct from u.union_mari and e.cle_mere is not distinct from u.union_femme
     Where :indi in (u.union_mari,u.union_femme)) as r

     ORDER BY case
              when (r.date_prem_enf is null) and (r.date_prem_fam is null) then r.date_dern_eve
              when (r.date_prem_enf is null) then r.date_prem_fam
              when (r.date_prem_fam is null) then r.date_prem_enf
              when (r.date_prem_fam<=r.date_prem_enf) then r.date_prem_fam
              else r.date_prem_enf
              end
              ,r.union_clef
     into
        ordre
       ,clef_union
       ,conjoint
       ,clef_marr
  do
    if ((c_inconnu=1) or (conjoint>0)) then
    suspend;
end^
SET TERM ; ^

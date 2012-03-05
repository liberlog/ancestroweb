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

CREATE PROCEDURE PROC_TQ_ASCENDANCE (
    I_CLEF Integer,
    I_NIVEAU Integer,
    I_PARQUI Integer,
    I_MODE Integer )
RETURNS (
    TQ_NIVEAU Integer,
    TQ_CLE_FICHE Integer,
    TQ_SOSA Double precision,
    TQ_DOSSIER Integer,
    IMPLEXE Double precision,
    TQ_DESCENDANT Integer )
AS
BEGIN SUSPEND; END^

CREATE PROCEDURE PROC_TQ_DESCENDANCE (
    I_CLEF Integer,
    I_NIVEAU Integer,
    I_PARQUI Integer,
    I_MODE Integer )
RETURNS (
    TQ_NIVEAU Integer,
    TQ_CLE_FICHE Integer,
    TQ_SOSA Varchar(120),
    TQ_CLE_PERE Integer,
    TQ_CLE_MERE Integer,
    TQ_NUM_SOSA Varchar(120),
    TQ_ASCENDANT Integer )
AS
BEGIN SUSPEND; END^
SET TERM ; ^

ALTER TABLE TQ_ARBREREDUIT ADD IMPLEXE Double precision;
ALTER TABLE TQ_ARBREREDUIT ADD TQ_DESCENDANT Integer;
ALTER TABLE TQ_ARBREREDUIT ADD TQ_CONJOINT Integer;
ALTER TABLE tq_arbredescendant ADD TQ_ASCENDANT Integer;

SET TERM ^ ;
ALTER PROCEDURE PROC_TQ_ASCENDANCE (
    I_CLEF Integer,
    I_NIVEAU Integer,
    I_PARQUI Integer,
    I_MODE Integer )
RETURNS (
    TQ_NIVEAU Integer,
    TQ_CLE_FICHE Integer,
    TQ_SOSA Double precision,
    TQ_CONJOINT Integer,
    IMPLEXE Double precision,
    TQ_DESCENDANT Integer )
AS
DECLARE VARIABLE I_COUNT INTEGER;
DECLARE VARIABLE I INTEGER;
DECLARE VARIABLE SOSA DOUBLE PRECISION;
begin
  i = 0;
  /* purge de la table pour le meme proprio de la table ---------------------*/
  delete from TQ_ARBREREDUIT;
  /*lui meme-----------------------------------------------------------------*/
  insert into TQ_ARBREREDUIT (tq_niveau,tq_cle_fiche,tq_sosa)
         values (0,:i_clef,1);
  I_COUNT=1;
  /*Tous les ancetres -------------------------------------------------------*/
  IF (I_MODE=1) THEN
    while (:i_count>0) do
    begin
         FOR SELECT tq_cle_fiche,TQ_SOSA FROM tq_arbrereduit
           WHERE tq_niveau =:i and IMPLEXE IS NULL
           ORDER BY TQ_SOSA
           INTO :I_CLEF,:SOSA
           DO
           BEGIN /*Par les hommes */
             if (I_PARQUI=1 or I_PARQUI=0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,IMPLEXE,tq_descendant)
               select :i+1,i.cle_pere,i.cle_mere,:SOSA*2,
                      (SELECT TQ_SOSA FROM TQ_ARBREREDUIT
                      WHERE tq_cle_fiche=i.cle_pere AND IMPLEXE IS NULL),:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_PERE IS NOT NULL;
             /*Par les femmes */
             if (I_PARQUI =2 or I_PARQUI =0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,IMPLEXE,tq_descendant)
               select :i+1,i.cle_mere,i.cle_pere,:SOSA*2+1,
                      (SELECT TQ_SOSA FROM TQ_ARBREREDUIT
                      WHERE tq_cle_fiche=i.cle_mere AND IMPLEXE IS NULL),:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_MERE IS NOT NULL;
           END
           i=i+1;
           Select Count(0) from tq_arbrereduit where tq_niveau=:i into :i_Count;
           if (I_NIVEAU>0) then if (i = I_NIVEAU) then I_COUNT=0;
    end
  ELSE IF (I_MODE=2) THEN
    while (:i_count>0) do
    begin
         FOR SELECT tq_cle_fiche,TQ_SOSA FROM tq_arbrereduit
           WHERE tq_niveau =:i
           ORDER BY TQ_SOSA
           INTO :I_CLEF,:SOSA
           DO
           BEGIN /*Par les hommes */
             if (I_PARQUI=1 or I_PARQUI=0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,IMPLEXE,tq_descendant)
               select :i+1,i.cle_pere,i.cle_mere,:SOSA*2,
                      (SELECT TQ_SOSA FROM TQ_ARBREREDUIT
                      WHERE tq_cle_fiche=i.cle_pere AND IMPLEXE IS NULL),:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_PERE IS NOT NULL;
             /*Par les femmes */
             if (I_PARQUI =2 or I_PARQUI =0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,IMPLEXE,tq_descendant)
               select :i+1,i.cle_mere,i.cle_pere,:SOSA*2+1,
                      (SELECT TQ_SOSA FROM TQ_ARBREREDUIT
                      WHERE tq_cle_fiche=i.cle_mere AND IMPLEXE IS NULL),:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_MERE IS NOT NULL;
           END
           i=i+1;
           Select Count(0) from tq_arbrereduit where tq_niveau=:i into :i_Count;
           if (I_NIVEAU>0) then if (i = I_NIVEAU) then I_COUNT=0;
    end
  ELSE
    while (:i_count>0) do
    begin
         FOR SELECT tq_cle_fiche,TQ_SOSA FROM tq_arbrereduit
           WHERE tq_niveau =:i
           ORDER BY TQ_SOSA
           INTO :I_CLEF,:SOSA
           DO
           BEGIN /*Par les hommes */
             if (I_PARQUI=1 or I_PARQUI=0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,tq_descendant)
               select :i+1,i.cle_pere,i.cle_mere,:SOSA*2,:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_PERE IS NOT NULL
                    AND NOT exists (select * FROM TQ_ARBREREDUIT
                                           where tq_cle_fiche=i.CLE_PERE);
             /*Par les femmes */
             if (I_PARQUI =2 or I_PARQUI =0) then
               insert into TQ_ARBREREDUIT
                      (tq_niveau,tq_cle_fiche,TQ_CONJOINT,tq_sosa,tq_descendant)
               select :i+1,i.cle_mere,i.cle_pere,:SOSA*2+1,:i_clef
                  from individu i
                  WHERE i.cle_fiche =:I_CLEF
                    AND i.CLE_MERE IS NOT NULL
                    AND NOT exists (select * FROM TQ_ARBREREDUIT
                                           where tq_cle_fiche=i.CLE_MERE);
           END
           i=i+1;
           Select Count(0) from tq_arbrereduit where tq_niveau=:i into :i_Count;
           if (I_NIVEAU>0) then if (i = I_NIVEAU) then I_COUNT=0;
    end
  for select tq_niveau
            ,tq_cle_fiche
            ,tq_sosa
            ,tq_conjoint
            ,implexe
            ,tq_descendant
      from tq_arbrereduit
      into :tq_niveau
          ,:tq_cle_fiche
          ,:tq_sosa
          ,:tq_conjoint
          ,:implexe
          ,:tq_descendant
      do suspend;
  delete from TQ_ARBREREDUIT;
end^
SET TERM ; ^



SET TERM ^ ;
ALTER PROCEDURE PROC_TQ_DESCENDANCE (
    I_CLEF Integer,
    I_NIVEAU Integer,
    I_PARQUI Integer,
    I_MODE Integer )
RETURNS (
    TQ_NIVEAU Integer,
    TQ_CLE_FICHE Integer,
    TQ_SOSA Varchar(120),
    TQ_CLE_PERE Integer,
    TQ_CLE_MERE Integer,
    TQ_NUM_SOSA Varchar(120),
    TQ_ASCENDANT Integer )
AS
declare variable i_count integer;
declare variable i integer;
declare variable j integer;
declare variable i_num_sosa varchar(120);
declare variable i_fiche integer;
declare variable i_pere integer;
declare variable i_mere integer;
declare variable sj char(1);
begin
  i = 1;
  delete from tq_arbredescendant;
  insert into tq_arbredescendant
          (tq_niveau,tq_cle_fiche,tq_num_sosa,tq_cle_pere,tq_cle_mere)
          select 1,:i_clef,'1',cle_pere,cle_mere
          from individu
          where cle_fiche=:i_clef;
  select count(0)
  from tq_arbredescendant
  where tq_niveau=:i into :i_count;
  if (i_niveau=1) then
    i_count=0;
  if (i_mode=1) then
  begin
    while (i_count>0) do
    begin
      i_count=0;
      for select tq_cle_fiche,tq_num_sosa from tq_arbredescendant
          where tq_niveau=:i and tq_sosa is null and tq_cle_fiche is not null
          order by tq_num_sosa
          into :i_clef,
               :i_num_sosa
      do
      begin
        j=0;
        for select i.cle_fiche,i.cle_pere,i.cle_mere
            from individu i
            left join evenements_ind ev on ev.ev_ind_kle_fiche=i.cle_fiche
            where (i.cle_pere=:i_clef or i.cle_mere=:i_clef)
            group by i.cle_fiche,i.cle_pere,i.cle_mere
            order by min(ev.ev_ind_date_year*12),min(ev.ev_ind_date)
        into :i_fiche,
             :i_pere,
             :i_mere
        do
        begin
          j=j+1;
          if (j<10) then sj=cast(j as char(1));
          else sj=ascii_char(j+55);
          insert into tq_arbredescendant
                (tq_niveau,tq_cle_fiche,tq_num_sosa,
                 tq_cle_pere,tq_cle_mere,tq_sosa,tq_ascendant)
          values (:i+1,:i_fiche,:i_num_sosa||:sj,:i_pere,:i_mere,
                 (select tq_num_sosa from tq_arbredescendant
                  where tq_cle_fiche=:i_fiche and tq_sosa is null),:i_clef);
          i_count=1;
        end
      end
      i=i+1;
      if (i_niveau>1 and i=i_niveau) then
        i_count=0;
    end
  end
  else
  if (i_mode=2) then
  begin
    while (i_count>0) do
    begin
      i_count=0;
      for select tq_cle_fiche,tq_num_sosa from tq_arbredescendant
          where tq_niveau=:i
          order by tq_num_sosa
          into :i_clef,
               :i_num_sosa
      do
      begin
        j=0;
        for select i.cle_fiche,i.cle_pere,i.cle_mere
            from individu i
            left join evenements_ind ev on ev.ev_ind_kle_fiche=i.cle_fiche
            where (i.cle_pere=:i_clef or i.cle_mere=:i_clef)
            group by i.cle_fiche,i.cle_pere,i.cle_mere
            order by min(ev.ev_ind_date_year*12),min(ev.ev_ind_date)
            into :i_fiche,
                 :i_pere,
                 :i_mere
        do
        begin
          j=j+1;
          if (j<10) then sj=cast(j as char(1));
          else sj=ascii_char(j+55);
          insert into tq_arbredescendant
                (tq_niveau,tq_cle_fiche,tq_num_sosa,
                 tq_cle_pere,tq_cle_mere,tq_sosa,tq_ascendant)
          values (:i+1,:i_fiche,:i_num_sosa||:sj,:i_pere,:i_mere,
           (select tq_num_sosa from tq_arbredescendant
            where tq_cle_fiche=:i_fiche and tq_sosa is null),:i_clef);
          i_count=1;
        end
      end
      i=i+1;
      if (i_niveau>1 and i=i_niveau) then
        i_count=0;
    end
  end
  else --i_mode=0
  begin
    while (i_count>0) do
    begin
      i_count=0;
      for select tq_cle_fiche,tq_num_sosa from tq_arbredescendant
          where tq_niveau=:i
          order by tq_num_sosa
          into :i_clef,
               :i_num_sosa
      do
      begin
        j=0;
        for select i.cle_fiche,i.cle_pere,i.cle_mere
            from individu i
            left join evenements_ind ev on ev.ev_ind_kle_fiche=i.cle_fiche
            where (i.cle_pere=:i_clef or i.cle_mere=:i_clef)
            and  not exists (select * from tq_arbredescendant
                              where tq_cle_fiche=i.cle_fiche)
            group by i.cle_fiche,i.cle_pere,i.cle_mere
            order by min(ev.ev_ind_date_year*12),min(ev.ev_ind_date)
            into :i_fiche,
                 :i_pere,
                 :i_mere
        do
        begin
          j=j+1;
          if (j<10) then sj=cast(j as char(1));
          else sj=ascii_char(j+55);
          insert into tq_arbredescendant
            (tq_niveau,tq_cle_fiche,tq_num_sosa,tq_cle_pere,tq_cle_mere,tq_ascendant)
          values (:i+1,:i_fiche,:i_num_sosa||:sj,:i_pere,:i_mere,:i_clef);
          i_count=1;
        end
      end
      i=i+1;
      if (i_niveau>1 and i=i_niveau) then
        i_count=0;
    end
  end
  if (i_parqui=1) then
    for select t.tq_niveau
              ,t.tq_cle_fiche
              ,t.tq_sosa
              ,t.tq_cle_pere
              ,t.tq_cle_mere
              ,t.tq_num_sosa
              ,t.tq_ascendant
        from tq_arbredescendant t
        inner join individu i on i.cle_fiche=t.tq_cle_fiche
        where t.tq_niveau=1
           or (t.tq_niveau=2 and i.sexe=1)
           or (t.tq_ascendant=t.tq_cle_pere and i.sexe=1)
        into :tq_niveau
            ,:tq_cle_fiche
            ,:tq_sosa
            ,:tq_cle_pere
            ,:tq_cle_mere
            ,:tq_num_sosa
            ,:tq_ascendant
    do suspend;
  else
  if (i_parqui=2) then
    for select t.tq_niveau
              ,t.tq_cle_fiche
              ,t.tq_sosa
              ,t.tq_cle_pere
              ,t.tq_cle_mere
              ,t.tq_num_sosa
              ,t.tq_ascendant
        from tq_arbredescendant t
        inner join individu i on i.cle_fiche=t.tq_cle_fiche
        where t.tq_niveau=1
           or (t.tq_niveau=2 and i.sexe=2)
           or (t.tq_ascendant=t.tq_cle_mere and i.sexe=2)
        into :tq_niveau
            ,:tq_cle_fiche
            ,:tq_sosa
            ,:tq_cle_pere
            ,:tq_cle_mere
            ,:tq_num_sosa
            ,:tq_ascendant
    do suspend;
  else
    for select tq_niveau
              ,tq_cle_fiche
              ,tq_sosa
              ,tq_cle_pere
              ,tq_cle_mere
              ,tq_num_sosa
              ,tq_ascendant
        from tq_arbredescendant
        into :tq_niveau
            ,:tq_cle_fiche
            ,:tq_sosa
            ,:tq_cle_pere
            ,:tq_cle_mere
            ,:tq_num_sosa
            ,:tq_ascendant
    do suspend;
  delete from tq_arbredescendant;
end^
SET TERM ; ^

SET TERM ^ ;
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

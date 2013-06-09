object DMWeb: TDMWeb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 408
  Width = 572
  object IBT_BASE: TIBTransaction
    DefaultDatabase = ibd_BASE
    DefaultAction = TACommitRetaining
    Left = 104
    Top = 16
  end
  object ibd_BASE: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_BASE
    AllowStreamedConnected = False
    Left = 40
    Top = 16
  end
  object IBS_DLL: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT g.dll_dossier'
      ',g.dll_indi as cle_fiche'
      ',i.nom'
      ',i.prenom'
      ',d.nom_dossier'
      'from gestion_dll g'
      'inner join individu i on i.cle_fiche=g.dll_indi'
      'inner join dossier d on d.cle_dossier=g.dll_dossier')
    Transaction = IBT_BASE
    Left = 40
    Top = 80
  end
  object IBS_UpdateDLL: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'UPDATE  GESTION_DLL'
      'SET DLL_RETOUR = :RETOUR')
    Transaction = IBT_BASE
    Left = 192
    Top = 200
  end
  object IBS_Sources_Record: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      
        'select * from SOURCES_RECORD WHERE DATA_ID = :Ikey  and TYPE_TAB' +
        'LE = :sTable')
    Transaction = IBT_BASE
    Left = 496
    Top = 136
  end
  object IBQ_TreeDesc: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT  t.tq_niveau,'
      '              t.tq_sosa,'
      '              t.tq_num_sosa,'
      '              i.CLE_FICHE,'
      '              i.CLE_PERE,'
      '              i.CLE_MERE,'
      '              i.PREFIXE,'
      '              i.NOM,'
      '              i.PRENOM,'
      '              i.SEXE,'
      '              i.DATE_NAISSANCE,'
      '              i.ANNEE_NAISSANCE,'
      '              i.DATE_DECES,'
      '              i.ANNEE_DECES,'
      '              i.AGE_AU_DECES,'
      '              i.DECEDE'
      
        '         FROM PROC_TQ_DESCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,2)' +
        ' t'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e'
      '         ORDER BY tq_num_sosa')
    Left = 192
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_NIVEAU'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_PARQUI'
        ParamType = ptInput
      end>
  end
  object IBQ_TreeBySurnames: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT  t.tq_niveau,'
      '              t.tq_sosa,'
      '             CLE_FICHE,'
      '              NUM_SOSA, CLE_PERE,'
      '              CLE_MERE,'
      '              NOM,'
      '              SEXE,'
      '              PRENOM,'
      '              b.EV_IND_VILLE as VILLE_BIRTH,'
      '              d.EV_IND_VILLE as VILLE_DEATH,'
      '              ANNEE_NAISSANCE,'
      '              ANNEE_DECES'
      
        '         FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) ' +
        't'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e left join EVENEMENTS_IND b on b.EV_IND_KLE_FICHE=cle_fiche and' +
        ' b.EV_IND_TYPE='#39'BIRT'#39' left join EVENEMENTS_IND d on d.EV_IND_KLE' +
        '_FICHE=cle_fiche and d.EV_IND_TYPE='#39'DEAT'#39
      'ORDER BY NOM,PRENOM,ANNEE_NAISSANCE DESC,ANNEE_DECES DESC')
    Left = 256
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_NIVEAU'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_PARQUI'
        ParamType = ptInput
      end>
  end
  object IBQ_TreeAsc: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT  t.tq_niveau,'
      '              t.tq_sosa,'
      '              i.CLE_FICHE,'
      '              i.CLE_IMPORTATION,'
      '              i.CLE_PARENTS,'
      '              i.CLE_PERE,'
      '              i.CLE_MERE,'
      '              i.PREFIXE,'
      '              i.NOM,'
      '              i.PRENOM,'
      '              i.SEXE,'
      '              i.DATE_NAISSANCE,'
      '              i.ANNEE_NAISSANCE,'
      '              i.DATE_DECES,'
      '              i.ANNEE_DECES,'
      '              i.DECEDE,'
      '              i.AGE_AU_DECES'
      
        '         FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,2) ' +
        't'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e'
      '         ORDER BY tq_sosa'
      '')
    Left = 192
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I_NIVEAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I_PARQUI'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Medias: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT '
      'MULTI_CLEF,MULTI_MEDIA ,  MULTI_NOM,  MULTI_PATH'
      '   FROM MULTIMEDIA,'
      '        MEDIA_POINTEURS'
      '   WHERE '
      'MP_MEDIA = MULTI_CLEF'
      ' AND'
      'MP_CLE_INDIVIDU =  :CLE_FICHE'
      ' AND'
      'MP_IDENTITE = :MP_IDENTITE'
      'AND '
      'MP_TABLE = :MP_TABLE'
      'AND          '
      'MULTI_IMAGE_RTF = :MULTI_IMAGE_RTF')
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLE_FICHE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MP_IDENTITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MP_TABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MULTI_IMAGE_RTF'
        ParamType = ptUnknown
      end>
  end
  object IBQ_ConjointSources: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      
        'select EV_FAM_KLE_FAMILLE, MP_MEDIA, MULTI_MEDIA, MULTI_PATH, MU' +
        'LTI_NOM, MULTI_CLEF'
      
        ' FROM EVENEMENTS_FAM, MEDIA_POINTEURS, MULTIMEDIA where MP_TABLE' +
        '='#39'F'#39
      'and MP_POINTE_SUR=EV_FAM_CLEF'
      'and MULTI_CLEF=MP_MEDIA'
      'and EV_FAM_KLE_FAMILLE = :I_CLEF_UNION'
      'ORDER BY MP_MEDIA')
    Left = 328
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF_UNION'
        ParamType = ptUnknown
      end>
  end
  object IBS_Conjoint: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'select'
      '     u.union_clef,'
      '     c.nom,'
      '     c.sexe,'
      '     c.prenom,'
      '     f.EV_FAM_CP,'
      '     f.EV_FAM_VILLE '
      '     ,case u.union_mari'
      '        when :I_CLEF then u.union_femme'
      '        else u.union_mari'
      '        end as conjoint,'
      '      (select first(1) ev_fam_date'
      '       from evenements_fam'
      
        '       where ev_fam_kle_famille=u.union_clef and ev_fam_date_yea' +
        'r is not null'
      '       order by ev_fam_date_year,ev_fam_date) as date_prem_fam,'
      '(select first(1) ev_fam_date_writen'
      '       from evenements_fam'
      
        '       where ev_fam_kle_famille=u.union_clef and ev_fam_date_yea' +
        'r is not null'
      
        '       order by ev_fam_date_year,ev_fam_date) as date_prem_fam_w' +
        'riten'
      '     FROM t_union u'
      
        '      left join individu c on (c.cle_fiche is not distinct from ' +
        'u.union_mari or c.cle_fiche is not distinct from u.union_femme) ' +
        'and cle_fiche<>:I_CLEF left join evenements_fam as f on union_cl' +
        'ef=EV_FAM_CLEF'
      '     Where :I_CLEF in (u.union_mari,u.union_femme)'
      '')
    Transaction = IBT_BASE
    Left = 192
    Top = 16
  end
  object IBS_Compte: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'select  * from proc_comptage(:I_DOSSIER)'
      '')
    Transaction = IBT_BASE
    Left = 256
    Top = 16
  end
  object IBS_Surnames: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'select NOM,COUNT(*) AS COUNTER from INDIVIDU'
      'WHERE KLE_DOSSIER=:I_DOSSIER  '
      'GROUP BY NOM'
      'ORDER BY NOM')
    Transaction = IBT_BASE
    Left = 328
    Top = 16
  end
  object IBS_TreeSurnames: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT NOM,COUNT(*) AS COUNTER'
      'FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) t'
      'inner join individu i on i.cle_fiche=t.tq_cle_fiche'
      'GROUP BY NOM'
      'ORDER BY NOM'
      '')
    Transaction = IBT_BASE
    Left = 400
    Top = 16
  end
  object IBS_Fiche: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'select NOM,PRENOM,'
      'b.EV_IND_DATE_WRITEN as DATE_NAISSANCE,b.EV_IND_DATE_YEAR'
      ' as ANNEE_NAISSANCE,b.EV_IND_VILLE'
      ' as LIEU_NAISSANCE,'
      'd.EV_IND_DATE_WRITEN as DATE_DECES,d.EV_IND_DATE_YEAR'
      ' as ANNEE_DECES,d.EV_IND_VILLE'
      ' as LIEU_DECES,'
      
        'SEXE FROM INDIVIDU i LEFT JOIN EVENEMENTS_IND b ON b.EV_IND_KLE_' +
        'FICHE = i.CLE_FICHE AND b.EV_IND_TYPE='#39'BIRT'#39' LEFT JOIN EVENEMENT' +
        'S_IND d ON d.EV_IND_KLE_FICHE = i.CLE_FICHE AND d.EV_IND_TYPE='#39'D' +
        'EAT'#39' WHERE i.CLE_FICHE =  :I_CLEF'
      '')
    Transaction = IBT_BASE
    Left = 400
    Top = 72
  end
  object IBS_Ages: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'select AGE_AU_DECES,SEXE,COUNT(*) AS COUNTER from INDIVIDU'
      'WHERE KLE_DOSSIER=:I_DOSSIER '
      'GROUP BY AGE_AU_DECES, SEXE'
      'ORDER BY AGE_AU_DECES DESC,SEXE')
    Transaction = IBT_BASE
    Left = 384
    Top = 200
  end
  object IBS_Jobs: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT EV_IND_DESCRIPTION,COUNT(*) AS COUNTER,EV_IND_VILLE'
      'FROM EVENEMENTS_IND'
      'WHERE EV_IND_KLE_DOSSIER=:I_DOSSIER '
      'AND EV_IND_TYPE='#39'OCCU'#39
      'GROUP BY EV_IND_DESCRIPTION,EV_IND_VILLE'
      'ORDER BY EV_IND_DESCRIPTION,EV_IND_VILLE')
    Transaction = IBT_BASE
    Left = 496
    Top = 200
  end
  object IBS_JobsInd: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      
        'SELECT EV_IND_DESCRIPTION, EV_IND_VILLE, EV_IND_PAYS, EV_IND_DAT' +
        'E'
      'FROM EVENEMENTS_IND'
      'WHERE EV_IND_KLE_FICHE=:CLE_FICHE '
      'AND EV_IND_TYPE='#39'OCCU'#39)
    Transaction = IBT_BASE
    Left = 424
    Top = 272
  end
  object IBS_TreeSurnamesDesc: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT NOM,COUNT(*) AS COUNTER'
      'FROM PROC_TQ_DESCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) t'
      'inner join individu i on i.cle_fiche=t.tq_cle_fiche'
      'GROUP BY NOM'
      'ORDER BY NOM'
      '')
    Transaction = IBT_BASE
    Left = 512
    Top = 16
  end
  object IBQ_TreeDescBySurnames: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT  t.tq_niveau,'
      '              t.tq_sosa,'
      '             CLE_FICHE,'
      '              NUM_SOSA, CLE_PERE,'
      '              CLE_MERE,'
      '              NOM,'
      '              SEXE,'
      '              PRENOM,'
      '              b.EV_IND_VILLE as VILLE_BIRTH,'
      '              d.EV_IND_VILLE as VILLE_DEATH,              '
      '              ANNEE_NAISSANCE,'
      '              ANNEE_DECES'
      
        '         FROM PROC_TQ_DESCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0)' +
        ' t'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e left join EVENEMENTS_IND b on b.EV_IND_KLE_FICHE=cle_fiche and' +
        ' b.EV_IND_TYPE='#39'BIRT'#39' left join EVENEMENTS_IND d on d.EV_IND_KLE' +
        '_FICHE=cle_fiche and d.EV_IND_TYPE='#39'DEAT'#39
      'ORDER BY NOM,PRENOM,ANNEE_NAISSANCE DESC,ANNEE_DECES DESC')
    Left = 384
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_NIVEAU'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'I_PARQUI'
        ParamType = ptInput
      end>
  end
  object IBS_Temp: TIBSQL
    Database = ibd_BASE
    GoToFirstRecordOnExecute = False
    ParamCheck = False
    Transaction = IBT_BASE
    Left = 40
    Top = 200
  end
  object IBQ_Dossier: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    ParamCheck = False
    SQL.Strings = (
      
        'select CLE_DOSSIER,NOM_DOSSIER,DS_BASE_PATH FROM DOSSIER ORDER B' +
        'Y CLE_DOSSIER')
    Left = 192
    Top = 336
  end
  object IBS_TreeMap: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      
        'SELECT NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS,COUNT (*) AS COUNT' +
        'ER'
      'FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) t'
      'inner join individu i on i.cle_fiche=t.tq_cle_fiche'
      'left join EVENEMENTS_IND e on i.cle_fiche=e.EV_IND_KLE_FICHE'
      'GROUP BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      'ORDER BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      '')
    Transaction = IBT_BASE
    Left = 40
    Top = 264
  end
  object IBS_MapAll: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      
        'SELECT NOM,EV_IND_CP,EV_IND_PAYS,EV_IND_VILLE,COUNT (*) AS COUNT' +
        'ER'
      'FROM individu i'
      'left join EVENEMENTS_IND e on i.cle_fiche=e.EV_IND_KLE_FICHE'
      'WHERE KLE_DOSSIER=:I_DOSSIER'
      'GROUP BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      'ORDER BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      ''
      '')
    Transaction = IBT_BASE
    Left = 40
    Top = 336
  end
  object IBS_TreeMapDes: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      
        'SELECT NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS,COUNT (*) AS COUNT' +
        'ER'
      'FROM PROC_TQ_DESCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) t'
      'inner join individu i on i.cle_fiche=t.tq_cle_fiche'
      'left join EVENEMENTS_IND e on i.cle_fiche=e.EV_IND_KLE_FICHE'
      'GROUP BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      'ORDER BY NOM,EV_IND_CP,EV_IND_VILLE,EV_IND_PAYS'
      ''
      '')
    Transaction = IBT_BASE
    Left = 192
    Top = 264
  end
  object IBS_CityCPost: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT CP_LATITUDE,CP_LONGITUDE,CP_VILLE'
      'FROM REF_CP_VILLE INNER JOIN REF_PAYS '
      'ON ( CP_PAYS = RPA_CODE ) '
      'WHERE RPA_LIBELLE=:I_PAYS '
      'AND CP_CP= :I_CP'
      'AND CP_LATITUDE >= -90'
      'AND CP_LATITUDE <= 90'
      'AND CP_LONGITUDE >= -180'
      'AND CP_LONGITUDE <= 180'
      'AND CP_VILLE <> '#39#39)
    Transaction = IBT_BASE
    Left = 304
    Top = 336
  end
  object IBS_City: TIBSQL
    Database = ibd_BASE
    SQL.Strings = (
      'SELECT FIRST 1 CP_LATITUDE,CP_LONGITUDE,CP_VILLE'
      'FROM REF_CP_VILLE INNER JOIN REF_PAYS '
      'ON ( CP_PAYS = RPA_CODE ) '
      'WHERE RPA_LIBELLE=:I_PAYS '
      'AND CP_CP= :I_CP'
      'AND CP_VILLE <> '#39#39)
    Transaction = IBT_BASE
    Left = 304
    Top = 256
  end
end

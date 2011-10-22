object DMWeb: TDMWeb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 408
  Width = 572
  object IBT_BASE: TIBTransaction
    DefaultDatabase = ibd_BASE
    DefaultAction = TACommitRetaining
    Left = 128
    Top = 8
  end
  object ibd_BASE: TIBDatabase
    DatabaseName = '/var/lib/firebird/2.5/data/Base.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_BASE
    AllowStreamedConnected = False
    Left = 32
    Top = 8
  end
  object IBQDLL: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT * FROM PROC_GESTION_DLL')
    Left = 32
    Top = 72
  end
  object IBQUpdateDLL: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'UPDATE  GESTION_DLL'
      'SET DLL_RETOUR = :RETOUR')
    Left = 128
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RETOUR'
        ParamType = ptUnknown
      end>
  end
  object IBQSources_Record: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      
        'select * from SOURCES_RECORD WHERE DATA_ID = :Ikey  and TYPE_TAB' +
        'LE = :sTable')
    Left = 152
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ikey'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sTable'
        ParamType = ptUnknown
      end>
  end
  object IBQ_TreeDesc: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT  t.tq_niveau,'
      '              t.tq_sosa,'
      '              t.tq_num_sosa,'
      '              i.CLE_FICHE,'
      '              i.CLE_IMPORTATION,'
      '              i.CLE_PARENTS,'
      '              i.CLE_PERE,'
      '              i.CLE_MERE,'
      '              i.PREFIXE,'
      '              i.NOM,'
      '              i.PRENOM,'
      '              i.SURNOM,'
      '              i.SUFFIXE,'
      '              i.SEXE,'
      '              i.DATE_NAISSANCE,'
      '              i.ANNEE_NAISSANCE,'
      '              i.DATE_DECES,'
      '              i.ANNEE_DECES,'
      '              i.DECEDE,'
      '              i.AGE_AU_DECES,'
      '              i.SOURCE,'
      '              i.COMMENT,'
      '              i.FILLIATION,'
      '              i.NUM_SOSA,'
      '              i.NCHI,'
      '              i.NMR,'
      '              i.CLE_FIXE'
      
        '         FROM PROC_TQ_DESCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,2)' +
        ' t'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e'
      '         ORDER BY tq_num_sosa')
    Left = 152
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_NIVEAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_PARQUI'
        ParamType = ptUnknown
      end>
  end
  object IBQ_TreeByNames: TIBQuery
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
      '              ANNEE_NAISSANCE,'
      '              ANNEE_DECES'
      
        '         FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) ' +
        't'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e'
      'ORDER BY NOM,PRENOM,ANNEE_NAISSANCE DESC,ANNEE_DECES DESC')
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_NIVEAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_PARQUI'
        ParamType = ptUnknown
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
      '              i.SURNOM,'
      '              i.SUFFIXE,'
      '              i.SEXE,'
      '              i.DATE_NAISSANCE,'
      '              i.ANNEE_NAISSANCE,'
      '              i.DATE_DECES,'
      '              i.ANNEE_DECES,'
      '              i.DECEDE,'
      '              i.AGE_AU_DECES,'
      '              i.SOURCE,'
      '              i.COMMENT,'
      '              i.FILLIATION,'
      '              i.NUM_SOSA,'
      '              i.NCHI,'
      '              i.NMR,'
      '              i.CLE_FIXE'
      
        '         FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,2) ' +
        't'
      
        '              inner join individu i on i.cle_fiche=t.tq_cle_fich' +
        'e'
      '         ORDER BY tq_sosa'
      '')
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_NIVEAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_PARQUI'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Medias: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT '
      'MULTI_MEDIA ,  MULTI_NOM,  MULTI_PATH'
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
    Left = 152
    Top = 200
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
        'LTI_NOM'
      
        ' FROM EVENEMENTS_FAM, MEDIA_POINTEURS, MULTIMEDIA where MP_TABLE' +
        '='#39'F'#39
      'and MP_POINTE_SUR=EV_FAM_CLEF'
      'and MULTI_CLEF=MP_MEDIA'
      'and EV_FAM_KLE_FAMILLE = :I_CLEF_UNION'
      'ORDER BY MP_MEDIA')
    Left = 208
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF_UNION'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Conjoint: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'select '
      '           CLE_FICHE'
      '            ,c.NOM'
      '            ,c.PRENOM'
      '            ,c.SEXE'
      '            ,p.clef_union as UNION_CLEF'
      '            ,m.ev_fam_date_writen as DATE_MARIAGE'
      '            ,m.ev_fam_date_year'
      '            ,m.ev_fam_ville'
      '            ,m.EV_FAM_CP'
      '            ,p.clef_marr'
      '      from proc_conjoints_ordonnes(:I_CLEF,0) p'
      '        left join evenements_fam m on m.ev_fam_clef=p.clef_marr'
      '        left join individu c on c.cle_fiche=p.conjoint '
      'ORDER BY ordre'
      '')
    Left = 236
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Compte: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'select  * from proc_comptage(:I_DOSSIER)'
      '')
    Left = 236
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_DOSSIER'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Names: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'select NOM,COUNT(*) AS COUNTER from INDIVIDU'
      'WHERE KLE_DOSSIER=:I_DOSSIER  '
      'GROUP BY NOM'
      'ORDER BY NOM')
    Left = 304
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_DOSSIER'
        ParamType = ptUnknown
      end>
  end
  object IBQ_TreeNames: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT NOM,COUNT(*) AS COUNTER'
      'FROM PROC_TQ_ASCENDANCE(:I_CLEF,:I_NIVEAU,:I_PARQUI,0) t'
      'inner join individu i on i.cle_fiche=t.tq_cle_fiche'
      'GROUP BY NOM'
      'ORDER BY NOM'
      '')
    Left = 304
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_NIVEAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'I_PARQUI'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Fiche: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'select NOM,PRENOM,'
      'DATE_NAISSANCE,LIEU_NAISSANCE,'
      'DATE_DECES,LIEU_DECES,'
      'SEXE FROM PROC_ETAT_FICHE ( :I_CLEF )'
      '')
    Left = 376
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end>
  end
  object IBQ_Dossier: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      'SELECT * FROM DOSSIER WHERE CLE_DOSSIER=:I_CLEF')
    Left = 32
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLEF'
        ParamType = ptUnknown
      end>
  end
  object IBS_Temp: TIBScript
    Database = ibd_BASE
    Transaction = IBT_BASE
    Terminator = ';'
    Statistics = False
    Left = 448
    Top = 128
  end
  object IBQ_AscExists: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    SQL.Strings = (
      
        'select * from RDB$PROCEDURES where rdb$Procedure_name = '#39'PROC_TQ' +
        '_ASCENDANCE'#39)
    Left = 456
    Top = 216
  end
end

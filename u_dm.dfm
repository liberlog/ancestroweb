object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 428
  Top = 321
  Height = 408
  Width = 572
  object IBT_BASE: TIBTransaction
    Active = False
    DefaultDatabase = ibd_BASE
    AutoStopAction = saNone
    Left = 104
    Top = 8
  end
  object ibd_BASE: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_BASE
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 8
  end
  object IBQDLL: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_GESTION_DLL')
    Left = 32
    Top = 80
    object IBQDLLCLE_FICHE: TIntegerField
      FieldName = 'CLE_FICHE'
      Origin = 'PROC_GESTION_DLL.CLE_FICHE'
    end
    object IBQDLLNOM: TIBStringField
      FieldName = 'NOM'
      Origin = 'PROC_GESTION_DLL.NOM'
      Size = 40
    end
    object IBQDLLPRENOM: TIBStringField
      FieldName = 'PRENOM'
      Origin = 'PROC_GESTION_DLL.PRENOM'
      Size = 60
    end
    object IBQDLLDOSSIER: TIntegerField
      FieldName = 'DOSSIER'
      Origin = 'PROC_GESTION_DLL.DOSSIER'
    end
  end
  object IBQUpdateDLL: TIBQuery
    Database = ibd_BASE
    Transaction = IBT_BASE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'UPDATE  GESTION_DLL'
      'SET DLL_RETOUR = :RETOUR')
    Left = 104
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RETOUR'
        ParamType = ptUnknown
      end>
  end
end

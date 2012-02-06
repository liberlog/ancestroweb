unit functions_html;

{$IFDEF FPC}
  {$MODE objfpc}{$H+}
{$ELSE}
 {$DEFINE WINDOWS}
{$ENDIF}

interface

uses
  Classes,
  {$IFNDEF FPC}
  fonctions_system,
  {$ENDIF}
  {$IFDEF VERSIONS}
  fonctions_version,
  {$ENDIF}
  SysUtils;

type THTMLULTabSheet = Record
      s_Title, s_link : String ;
      b_SheetSelected : Boolean ;
      a_Pages : Array of Record
                          s_Key, s_link : String ;
                          b_PageSelected : Boolean ;
                         End;
    end;
  TAHTMLULTabSheet = Array of THTMLULTabSheet;

const CST_HTML_DIV                 = 'DIV' ;
      CST_HTML_CENTER              = 'CENTER' ;
      CST_HTML_DIV_BEGIN           = '<'+CST_HTML_DIV+'>' ;
      CST_HTML_DIV_END             = '</'+CST_HTML_DIV+'>' ;
      CST_HTML_UL                  = 'UL' ;
      CST_HTML_MENU                 = 'tabsheets' ;
      CST_HTML_SUBMENU              = 'subsheets' ;
      CST_HTML_UL_BEGIN            = '<'+CST_HTML_UL+'>' ;
      CST_HTML_UL_END              = '</'+CST_HTML_UL+'>' ;
      CST_HTML_TABLE               = 'TABLE' ;
      CST_HTML_TABLE_BEGIN         = '<'+CST_HTML_TABLE+'>' ;
      CST_HTML_STRONG              = 'STRONG' ;
      CST_HTML_STRONG_BEGIN        = '<'+CST_HTML_STRONG+'>' ;
      CST_HTML_STRONG_END          = '</'+CST_HTML_STRONG+'>' ;
      CST_HTML_TABLE_END           = '</'+CST_HTML_TABLE+'>' ;
      CST_HTML_TR                  = 'TR' ;
      CST_HTML_TR_BEGIN            = '<'+CST_HTML_TR+'>' ;
      CST_HTML_TR_END              = '</'+CST_HTML_TR+'>' ;
      CST_HTML_TD                  = 'TD' ;
      CST_HTML_TD_BEGIN            = '<'+CST_HTML_TD+'>' ;
      CST_HTML_TD_END              = '</'+CST_HTML_TD+'>' ;
      CST_HTML_LI                  = 'LI' ;
      CST_HTML_LI_BEGIN            = '<'+CST_HTML_LI+'>' ;
      CST_HTML_LI_LEFT             = '<'+CST_HTML_LI+' CLASS="tab_left">' ;
      CST_HTML_LI_MIDDLE           = '<'+CST_HTML_LI+' CLASS="tab_middle">' ;
      CST_HTML_LI_RIGHT            = '<'+CST_HTML_LI+' CLASS="tab_right">' ;
      CST_HTML_LI_END              = '</'+CST_HTML_LI+'>' ;
      CST_HTML_A_BEGIN             = '<A' ;
      CST_HTML_A_END               = '</A>' ;
      CST_HTML_AHREF               = CST_HTML_A_BEGIN + ' HREF="' ;
      CST_HTML_SPAN                = 'SPAN' ;
      CST_HTML_SPAN_END            = '</'+CST_HTML_SPAN+'>' ;
      CST_HTML_SPAN_BEGIN          = '<'+CST_HTML_SPAN+'>' ;
      CST_HTML_Paragraph           = 'P';
      CST_HTML_Paragraph_BEGIN     = '<P>';
      CST_HTML_Paragraph_END       = '</P>';
      CST_HTML_Body_END            = '</BODY>';
      CST_HTML_HTML_END            = '</HTML>';
      CST_HTML_CENTER_BEGIN        = '<'+CST_HTML_CENTER+'>';
      CST_HTML_CENTER_END          = '</'+CST_HTML_CENTER+'>';
      CST_HTML_IMAGE_BEGIN         = '<IMG';
      CST_HTML_IMAGE_SRC           = '<IMG SRC="';
      CST_HTML_ID_EQUAL            = ' ID=';
      CST_HTML_NAME_EQUAL          = ' NAME=';
      CST_HTML_TARGET_EQUAL        = ' TARGET=';
      CST_HTML_TARGET_BLANK        = '_blank';
      CST_HTML_TARGET_TOP          = '_top';
      CST_HTML_TARGET_PARENT       = '_parent';
      CST_HTML_CLASS_EQUAL         = ' CLASS=';
      CST_HTML_COLSPAN_EQUAL       = ' COLSPAN=';
      CST_HTML_BR                  = '<BR>';
      CST_HTML_H1                 = 'H1';
      CST_HTML_H1_BEGIN            = '<'+ CST_HTML_H1 + '>';
      CST_HTML_H1_END              = '</'+ CST_HTML_H1 + '>';
      CST_HTML_H2                 = 'H2';
      CST_HTML_H2_BEGIN            = '<'+ CST_HTML_H2 + '>';
      CST_HTML_H2_END              = '</'+ CST_HTML_H2 + '>';
      CST_HTML_H3                 = 'H3';
      CST_HTML_H3_BEGIN            = '<'+ CST_HTML_H3 + '>';
      CST_HTML_H3_END              = '</'+ CST_HTML_H3 + '>';
      CST_HTML_H4                 = 'H4';
      CST_HTML_H4_BEGIN            = '<'+ CST_HTML_H4 + '>';
      CST_HTML_H4_END              = '</'+ CST_HTML_H4 + '>';
      CST_HTML_DIV_SHOW            = ' STYLE="display:block"';

      CST_EXTENSION_HTML           = '.htm' ;
      CST_EXTENSION_PHP            = '.php' ;

      CST_HTML_DIR_SEPARATOR       = '/' ;
      CST_HTML_OUTDIR_SEPARATOR     = '..' + CST_HTML_DIR_SEPARATOR;

      // to replace
      CST_HTML_HEAD_IN_LANG_FILE   :Array [0..1] of String= ('Author','Keywords');
      CST_HTML_HEAD_AUTOKEYS       = 'AutoKeywords';
      CST_HTML_HEAD_DESCRIBE       = 'Description';
      CST_HTML_HEAD_TITLE          = 'Title';
      CST_HTML_HEAD_CHARSET        = 'Charset';
      CST_HTML_SECURITY            = 'Security';
      CST_HTML_LANG                = 'Lang';
      CST_HTML_LANGUAGE            = 'Language';
      CST_HTML_NAME                = 'Name';
      CST_HTML_CAPTION             = 'Caption';
      CST_HTML_RESET               = 'Reset';
      CST_HTML_SEND                = 'Send';
      CST_HTML_MAIL_IN_LANG_FILE   :Array [0..8] of String=  (CST_HTML_LANG,CST_HTML_LANGUAGE,'MailFrom','MailSentMessage','MailSubject','Message',CST_HTML_NAME,CST_HTML_RESET,CST_HTML_SEND);


      // files
      CST_HTML_FILE_HEAD         = 'Head.htm';
      {$IFDEF VERSIONS}
       gver_fonctions_html : T_Version = ( Component : 'Static Web Site Management' ;
                                           FileUnit : 'fonctions_languages' ;
                    			   Owner : 'Matthieu Giroux' ;
                    			   Comment : 'Static Web Site Management' ;
                    			   BugsStory : 'Version 0.9.0.0 : Created from old project.' + #13#10;
                    			   UnitType : 1 ;
                    			   Major : 0 ; Minor : 9 ; Release : 0 ; Build : 0 );
      {$ENDIF}

function fs_CreateULTabseets ( const at_TabSheets : TAHTMLULTabSheet ;
                               const as_Subdir : String ; const as_idMenu : String = CST_HTML_MENU ;
                               const ab_ShowPages : Boolean = True;
                               const ab_NoLink   : Boolean = False;
                               const ai_PageBegin : Longint = 1 ;
                               const as_Target    : String  = '') : String;
function fs_CreateElementWithId ( const as_ElementType   : String ;
                                       const as_idElement     : String ;
                                       const as_OptionToSetId : String = CST_HTML_ID_EQUAL ) : String;
procedure p_LoadStringList ( const astl_ToLoad : TStrings ; const as_SourceDir, as_File : String );

function  fs_Create_Image           ( const as_Image       : String;
                                      const as_Alt         : String  = '';
                                      const as_Id          : String  = ''):String ;
function  fs_Create_TD             ( const as_Name        : String  = ''  ;
                                     const as_IdEqual  : String = CST_HTML_ID_EQUAL;
                                     const ai_Colspan     : Integer = 1  ):String ;
function  fs_Create_Link           ( const as_href        : String   ;
                                     const as_Text        : String   ;
                                     const as_Target      : String = ''):String ;
function  fs_Create_DIV             ( const as_Name        : String      ;
                                      const as_IdEqual  : String = CST_HTML_ID_EQUAL;
                                      const Is_Visible  : Boolean   = False ):String ;
function  fs_Create_Text            ( const as_Text        : String      ;
                                      const as_Option      : String = '' ):String ;
function  fs_Replace_EndLines       ( const as_Text        : String      ;
                                      const ReplaceWith : String = CST_HTML_BR ):String ;
function fs_createHead (const as_PathFiles,as_Describe, as_Keywords, as_title : String): String;
procedure p_CreateHTMLFile ( const at_TabSheets : TAHTMLULTabSheet ;
                             const astl_Destination : TStrings ;
                             const as_EndPage, as_PathFiles,
                                   as_Describe, as_Keywords,
                                   as_title, as_LongTitle, as_IdOfPageMainElement : String ;
                             const as_FileBeforeHead, as_FileAfterHead,
                                   as_FileAfterMenu  , as_FileAfterBody,
                                   as_Subdir ,
                                   as_BeforeHTML : String  );
function fs_GetSheetLink ( const at_TabSheets : TAHTMLULTabSheet ;
                           const as_Title : String ;
                           const as_KeyPage : String ):String;
function fb_FindTabSheet ( const at_TabSheets : TAHTMLULTabSheet ;
                           const as_Title : String ;
                           const as_KeyPage : String ;
                           var   ai_Main, ai_Page : Longint):Boolean;
procedure p_FreeKeyWords;
procedure p_addKeyWord ( const as_KeyWord : String; const ach_Separator : Char = ' ' );
procedure p_CreateKeyWords;
procedure p_AddTabSheet ( var  at_TabSheets : TAHTMLULTabSheet ;
                          const as_Title, as_link : String );
procedure p_AddTabSheetPage ( var  at_TabSheets : TAHTMLULTabSheet ;
                             const ai_pos : Longint ;
                             const as_link : String ;
                             const as_keyPage : String = '');
procedure p_SelectTabSheet ( const at_TabSheets : TAHTMLULTabSheet ;
                             const as_Title : String ;
                             const as_KeyPage : String = '' ;
                             const ab_Select : Boolean = True );

var gs_html_source_file : String = 'Files' + DirectorySeparator;
    gstl_HeadKeyWords             : TStringlist = nil ;
    gs_HtmlCharset : String ={$IFDEF FPC}'utf-8'{$ELSE}'iso-8859-1'{$ENDIF};



implementation

uses Dialogs,fonctions_languages, fonctions_string,
     unite_html_resources;


function fb_FindTabSheet ( const at_TabSheets : TAHTMLULTabSheet ;
                           const as_Title : String ;
                           const as_KeyPage : String ;
                           var   ai_Main, ai_Page : Longint):Boolean;
var li_i, li_j          : Integer;
Begin
 Result := False;
 for li_i := 0 to high ( at_TabSheets ) do
  with at_TabSheets [ li_i ] do
    Begin
      if s_Title=as_Title Then
        Begin
          ai_Main := li_i;
          if ( as_KeyPage = '' )
          or ( High(a_Pages) < 0 )
           Then Exit
           Else
            for li_j := 0 to High(a_Pages) do
             with a_Pages [ li_j ] do
              if ( as_KeyPage = s_Key )
              or ( li_j = high ( a_Pages ))
              or (( as_KeyPage < a_Pages [ li_j +1].s_Key ) and ( as_KeyPage >= s_Key )) Then
              Begin
                ai_Page := li_j;
                Result := True;
                Exit;
              end;
          Exit;
        end;
    end;
end;

function fs_GetSheetLink ( const at_TabSheets : TAHTMLULTabSheet ;
                           const as_Title : String ;
                           const as_KeyPage : String ):String;
var li_i, li_j          : LongInt;
    lb_IsPage : Boolean ;
Begin
 li_i := -1 ;
 li_j := -1 ;
 lb_Ispage := fb_FindTabSheet ( at_TabSheets, as_Title, as_KeyPage, li_i, li_j );
 if li_i >= 0 Then
  with at_TabSheets [ li_i ] do
   if lb_IsPage
   Then Result := a_Pages [ li_j ].s_link
   Else Result := s_link;
end;
procedure p_SelectTabSheet ( const at_TabSheets : TAHTMLULTabSheet ;
                             const as_Title : String ;
                             const as_KeyPage : String = '' ;
                             const ab_Select : Boolean = True );
var li_i, li_j          : LongInt;
    lb_IsPage : Boolean ;
Begin
 li_i := -1 ;
 li_j := -1 ;
 lb_Ispage := fb_FindTabSheet ( at_TabSheets, as_Title, as_KeyPage, li_i, li_j );
 if li_i >= 0 Then
  with at_TabSheets [ li_i ] do
   if lb_IsPage
   Then a_Pages [ li_j ].b_PageSelected:=ab_Select
   Else b_SheetSelected:=ab_Select;
end;

procedure p_AddTabSheet ( var  at_TabSheets : TAHTMLULTabSheet ;
                          const as_Title, as_link : String );
begin
  SetLength(at_TabSheets, high ( at_TabSheets ) + 2);
  with at_TabSheets [ High(at_TabSheets)] do
    Begin
      s_Title:=as_Title;
      s_link :={$IFDEF WINDOWS}fs_RemplaceChar ( {$ENDIF}as_link{$IFDEF WINDOWS}, DirectorySeparator, CST_HTML_DIR_SEPARATOR ){$ENDIF};
    end;
end;
procedure p_AddTabSheetPage ( var  at_TabSheets : TAHTMLULTabSheet ;
                             const ai_pos : Longint ;
                             const as_link : String ;
                             const as_keyPage : String = '');

begin
 with at_TabSheets [ ai_pos ] do
  Begin
    SetLength ( a_Pages, high ( a_Pages ) + 2);
    with a_Pages [ High(a_Pages)] do
      Begin
       s_link := {$IFDEF WINDOWS}fs_RemplaceChar ( {$ENDIF}as_link{$IFDEF WINDOWS}, DirectorySeparator, CST_HTML_DIR_SEPARATOR ){$ENDIF};
       s_Key  := as_keyPage;
      end;
  end;
end;

procedure p_addKeyWord ( const as_KeyWord : String; const ach_Separator : Char = ' ' );
var lstl_Keywords : TStringList;
    ls_KeyWord    : String;
    li_i          : Integer;
Begin
  lstl_Keywords := nil;
  p_ChampsVersListe ( lstl_Keywords, as_KeyWord, ach_Separator );
  for li_i:= 0 to lstl_Keywords.Count-1 do
    Begin
      ls_KeyWord := Trim ( lstl_Keywords [ li_i ] );
      if gstl_HeadKeyWords.IndexOf(ls_KeyWord)<0 Then
        gstl_HeadKeyWords.add (ls_KeyWord);
    end;
end;

procedure p_FreeKeyWords;
Begin
  gstl_HeadKeyWords.Free;
  gstl_HeadKeyWords := nil;
end;

procedure p_CreateKeyWords;
Begin
  gstl_HeadKeyWords.Free;
  gstl_HeadKeyWords := TStringList.Create;
end;


function  fs_Create_DIV             ( const as_Name        : String      ;
                                      const as_IdEqual  : String = CST_HTML_ID_EQUAL;
                                      const Is_Visible  : Boolean   = False ):String ;
Begin
  If Is_Visible
    Then
      Result := '<' + CST_HTML_DIV + as_IdEqual + '"' + as_Name + '"' + CST_HTML_DIV_SHOW + '>'
    Else
      Result := '<' + CST_HTML_DIV + as_IdEqual + '"' +  as_Name +  '"' + '>' ;
End ;
function  fs_Create_TD             ( const as_Name        : String  = ''  ;
                                      const as_IdEqual  : String = CST_HTML_ID_EQUAL;
                                      const ai_Colspan     : Integer = 1  ):String ;
Begin
  Result := '<' + CST_HTML_TD ;
  if as_Name    <> '' Then AppendStr(Result, as_IdEqual + '"' + as_Name + '"' );
  if ai_Colspan >  1  Then AppendStr(Result, CST_HTML_COLSPAN_EQUAL + '"' + IntToStr(ai_Colspan) + '"' );
  AppendStr(Result, '>' );
End ;
function  fs_Replace_EndLines       ( const as_Text        : String      ;
                                      const ReplaceWith : String = CST_HTML_BR ):String ;
begin
  Result := StringReplace ( as_Text, CST_ENDOFLINE, CST_HTML_BR+CST_ENDOFLINE,[rfReplaceAll] );
end;

function  fs_Create_Text            ( const as_Text        : String      ;
                                      const as_Option      : String = '' ):String ;

  Begin
    If length (as_Text) = 0
      Then
        Exit ;

    If as_Text [1] = '@'
      Then
        If pos ( '#', as_Text ) > 2
          Then
            Result := CST_HTML_A_BEGIN + copy ( as_Text, 2, pos ( '#', as_Text ) - 2 ) + '><' + CST_HTML_SPAN  + as_Option + '>'
                            + copy ( as_Text   , pos ( '#', as_Text ) + 1 , length (as_Text) - pos ( '#', as_Text )) + CST_HTML_SPAN_END+CST_HTML_A_END
          Else
            Result := CST_HTML_AHREF + copy ( as_Text, 2, length ( as_Text ) - 1 ) + '"><' + CST_HTML_SPAN  + as_Option + '>' + as_Text + CST_HTML_SPAN_END+CST_HTML_A_END
      Else
            Result := '<' + CST_HTML_SPAN  + as_Option + '>' + as_Text + CST_HTML_SPAN_END ;
  End ;


procedure p_LoadStringList ( const astl_ToLoad : TStrings ; const as_SourceDir, as_File : String );
begin
// Charge le fichier de base
  try
    if FileExists(as_SourceDir + gs_html_source_file + as_File)
     Then astl_ToLoad.LoadFromFile ( as_SourceDir + gs_html_source_file + as_File)
     Else astl_ToLoad.Clear;
  Except
    ShowMessage ( StringReplace ( gs_StringsHTML_cantOpenFile, '@ARG', as_SourceDir + gs_html_source_file + as_File, [rfReplaceAll] ));
    Abort ;
  End ;
End;

function fs_CreateElementWithId ( const as_ElementType   : String ;
                                       const as_idElement     : String ;
                                       const as_OptionToSetId : String = CST_HTML_ID_EQUAL ) : String;
Begin
  Result := '<' + as_ElementType + as_OptionToSetId + '"' + as_idElement + '">';
end;
function  fs_Create_Link           ( const as_href        : String   ;
                                     const as_Text        : String   ;
                                     const as_Target      : String = ''):String ;
begin
  Result := CST_HTML_AHREF + as_href + '"' ;
  if as_Target <> '' Then
    AppendStr(Result,CST_HTML_TARGET_EQUAL+'"' + as_Target + '"');
  AppendStr(Result,'>'+as_Text+CST_HTML_A_END);
end;

function fs_CreateULTabseets ( const at_TabSheets : TAHTMLULTabSheet ;
                               const as_Subdir : String ;
                               const as_idMenu : String = CST_HTML_MENU ;
                               const ab_ShowPages : Boolean = True;
                               const ab_NoLink   : Boolean = False;
                               const ai_PageBegin : Longint = 1 ;
                               const as_Target    : String  = '') : String;
var li_i, li_j : Longint;
    lhut_sheet, la_Pages : THTMLULTabSheet;
    ls_Link : String ;
Begin

    if high ( at_TabSheets ) > 0 Then
    Begin
      Result := fs_CreateElementWithId ( CST_HTML_DIV, as_idMenu )
             +  fs_CreateElementWithId ( CST_HTML_UL , as_idMenu ) +CST_ENDOFLINE;
      for li_i := 0 to  high ( at_TabSheets ) do
        Begin
          lhut_sheet := at_TabSheets [ li_i ];
          if li_i = 0 Then
            AppendStr(Result,CST_HTML_LI_LEFT)
          else if li_i = high ( at_TabSheets ) Then
            AppendStr(Result,CST_HTML_LI_RIGHT)
          else
            AppendStr(Result,CST_HTML_LI_MIDDLE);
          with lhut_sheet do
            Begin
              if b_SheetSelected
              Then AppendStr(Result,s_Title)
              Else
               Begin
                 if ab_NoLink
                  Then ls_Link := ''
                  else ls_Link := as_Subdir + s_Link;
                 if ( high ( a_Pages ) >= 0 )
                  Then AppendStr(Result,fs_Create_Link( ls_link + '#' + s_Title ,  s_Title, as_Target ))
                  Else AppendStr(Result,fs_Create_Link( ls_link,  s_Title, as_Target ));
               end;
              if ab_ShowPages
              and ( high ( a_Pages ) >= 0 ) Then
               Begin
                 AppendStr(Result, ' (' );
                 for li_j := 0 to high ( a_Pages ) do
                   with a_Pages [ li_j ] do
                    Begin
                      if b_PageSelected
                      Then AppendStr(Result,' ' + IntToStr(ai_PageBegin+li_j))
                      Else AppendStr(Result,' ' +fs_Create_Link( ls_link + '#' + s_Title , IntToStr(ai_PageBegin+li_j), as_Target ));
                    end;
                 AppendStr(Result, ' )' );
               end;
            end;
          AppendStr(Result,CST_HTML_LI_END+CST_ENDOFLINE);
        end;
      AppendStr(Result,CST_HTML_UL_END+CST_HTML_DIV_End+CST_HTML_BR+CST_ENDOFLINE);
    end
  Else Result := '' ;
end;

function fs_createHead (const as_PathFiles,as_Describe, as_Keywords, as_title : String ): String;
var  lstl_Head : TStringList;
Begin
  lstl_Head := TStringList.Create;
  p_LoadStringList ( lstl_Head, as_PathFiles, CST_HTML_FILE_HEAD );
  p_ReplaceLanguagesStrings ( lstl_Head, CST_HTML_HEAD_IN_LANG_FILE );
  p_ReplaceLanguagesStrings ( lstl_Head, CST_HTML_HEAD_IN_LANG_FILE );
  p_ReplaceLanguageString(lstl_Head,CST_HTML_HEAD_DESCRIBE,StringReplace (as_Describe, CST_ENDOFLINE, '', [rfReplaceAll]));
  p_ReplaceLanguageString(lstl_Head,CST_HTML_HEAD_CHARSET,gs_HtmlCharset);
  p_ReplaceLanguageString(lstl_Head,CST_HTML_HEAD_TITLE,as_title);
  p_ReplaceLanguageString(lstl_Head,CST_HTML_LANG,gs_Lang);
  p_ReplaceLanguageString(lstl_Head,CST_HTML_HEAD_AUTOKEYS,StringReplace (as_Keywords, CST_ENDOFLINE, ',', [rfReplaceAll]));
  Result := lstl_Head.Text;
end;

procedure p_CreateHTMLFile ( const at_TabSheets : TAHTMLULTabSheet ;
                             const astl_Destination : TStrings ;
                             const as_EndPage, as_PathFiles,
                                   as_Describe, as_Keywords,
                                   as_title, as_LongTitle, as_IdOfPageMainElement : String ;
                             const as_FileBeforeHead, as_FileAfterHead,
                                   as_FileAfterMenu  , as_FileAfterBody,
                                   as_Subdir ,
                                   as_BeforeHTML : String  );
var  lstl_HTML : TStringList;
     ls_Text1, ls_Text2, ls_Text3, ls_Text4  : String ;

Begin
  lstl_HTML := TStringList.Create;
  if as_FileBeforeHead <> '' Then
    Begin
      p_LoadStringList ( lstl_HTML, as_PathFiles, as_FileBeforeHead );
      ls_Text1 := lstl_HTML.Text;
    end
   Else ls_Text1 := '' ;
  if as_FileAfterHead <> '' Then
    Begin
      p_LoadStringList ( lstl_HTML, as_PathFiles, as_FileAfterHead );
      ls_Text2 := lstl_HTML.Text;
    end
   Else ls_Text2 := '' ;
  if as_FileAfterMenu <> '' Then
    Begin
      p_LoadStringList ( lstl_HTML, as_PathFiles, as_FileAfterMenu );
      p_ReplaceLanguageString(lstl_HTML,CST_HTML_CAPTION,as_LongTitle);
      ls_Text3 := lstl_HTML.Text;
    end
   Else ls_Text3 := '' ;
  if as_FileAfterBody <> '' Then
    Begin
      p_LoadStringList ( lstl_HTML, as_PathFiles, as_FileAfterBody );
      ls_Text4 := lstl_HTML.Text;
    end
   Else ls_Text4 := '';
  p_LoadStringList ( lstl_HTML, as_PathFiles, CST_HTML_FILE_HEAD );
  p_ReplaceLanguagesStrings ( lstl_HTML, CST_HTML_HEAD_IN_LANG_FILE );
  p_ReplaceLanguageString(lstl_HTML,CST_HTML_HEAD_DESCRIBE,StringReplace (as_Describe, CST_ENDOFLINE, '', [rfReplaceAll]));
  p_ReplaceLanguageString(lstl_HTML,CST_HTML_HEAD_TITLE,as_title);
  p_ReplaceLanguageString(lstl_HTML,CST_HTML_HEAD_AUTOKEYS,StringReplace (as_Keywords, CST_ENDOFLINE, ',', [rfReplaceAll]));
  astl_Destination.Text := as_BeforeHTML + CST_ENDOFLINE + ls_Text1 + CST_ENDOFLINE + fs_createHead(as_PathFiles,as_Describe, as_Keywords, as_title) + CST_ENDOFLINE + ls_Text2
                        +  fs_CreateElementWithId(CST_HTML_DIV, 'title', CST_HTML_CLASS_EQUAL )
                        +  CST_HTML_H1_BEGIN + as_title + CST_HTML_H1_END + CST_HTML_DIV_End
                        +  CST_ENDOFLINE + fs_CreateULTabseets ( at_TabSheets, as_Subdir ) + CST_ENDOFLINE + ls_Text3
                        +  CST_ENDOFLINE + fs_CreateElementWithId ( CST_HTML_DIV, as_IdOfPageMainElement )
                        +  CST_ENDOFLINE + astl_Destination.Text
                        +  CST_ENDOFLINE + CST_HTML_DIV_End
                        +  CST_ENDOFLINE + fs_Replace_EndLines(as_EndPage)
                        +  CST_ENDOFLINE + ls_Text4;
end;

function  fs_Create_Image           ( const as_Image       : String;
                                      const as_Alt         : String  = '';
                                      const as_Id          : String  = ''):String ;
  Begin
    Result := CST_HTML_IMAGE_SRC + as_Image + '"' ;
    If as_Alt <> '' Then AppendStr ( Result, ' ALT="' + as_Alt + '"' );
    If as_Id  <> '' Then AppendStr ( Result, CST_HTML_ID_EQUAL + '"' + as_id + '"' );
    AppendStr ( Result, ' />' );
  End ;



initialization
{$IFDEF VERSIONS}
  p_ConcatVersion ( gver_fonctions_html );
{$ENDIF}
finalization
  p_FreeKeyWords;
end.


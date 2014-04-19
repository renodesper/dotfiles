" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "argokai"
" }}}
"
"" Gvim Highlighting: (see :help highlight-groups)"{{{
" ---------------------------------------------------------------------
" First, the Normal
hi Normal        guifg=#f4f4ee guibg=#1B1D1E gui=NONE
" ---------------------------------------------------------------------
" The Languages stuff
hi Title         guifg=#b2b2b2 guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Comment       guifg=#465457 guibg=NONE    gui=italic
" ---------------------------------------------------------------------
" hi Constant      guifg=#e3588d guibg=NONE    gui=NONE
hi Constant      guifg=#a4ed2d guibg=NONE    gui=NONE
hi String        guifg=#6497c5 guibg=NONE    gui=NONE
hi Character     guifg=#a4ed2d guibg=NONE    gui=NONE
hi Number        guifg=NONE    guibg=NONE    gui=NONE
hi Boolean       guifg=#a4ed2d guibg=NONE    gui=NONE
hi Float         guifg=#F8F8F2 guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
"hi Identifier    guifg=#40ffff guibg=NONE    gui=NONE
hi Identifier    guifg=#6497c5 guibg=NONE    gui=NONE
hi Function      guifg=#A6E22E guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
"hi Statement     guifg=#ff8036 guibg=NONE    gui=NONE
"hi Statement     guifg=#ee82ee guibg=NONE    gui=NONE
"hi Statement     guifg=#f26d99 guibg=NONE    gui=NONE
"hi Statement     guifg=#b06bfc guibg=NONE    gui=NONE
"hi Statement     guifg=#f88379 guibg=NONE    gui=NONE
hi Statement     guifg=#f64a8a guibg=NONE    gui=NONE
"hi Conditional   guifg=#c72723 guibg=NONE    gui=NONE
hi Conditional   guifg=#a4ed2d guibg=NONE    gui=NONE
" hi Repeat       guifg= guibg=NONE    gui=NONE
" hi Label       guifg= guibg=NONE    gui=NONE
hi Operator      guifg=#ff8036 guibg=NONE    gui=NONE
" hi Keyword       guifg= guibg=NONE    gui=NONE
hi Exception     guifg=#e4d00a guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi PreProc       guifg=#A6E22E guibg=NONE    gui=NONE
" hi Include       guifg= guibg=NONE    gui=NONE
"hi Define        guifg=#bada55 guibg=NONE    gui=NONE
" hi Macro        guifg=#bada55 guibg=NONE    gui=NONE
" hi PreCondit        guifg=#bada55 guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
"hi Type          guifg=#26ffa1 guibg=NONE    gui=NONE
"hi Type          guifg=#ff3800 guibg=NONE    gui=NONE
hi Type          guifg=#6497c5   guibg=NONE    gui=NONE
"hi StorageClass  guifg=#f4bbff guibg=NONE    gui=NONE
hi StorageClass  guifg=#6497c5 guibg=NONE    gui=NONE
" hi Structure  guifg= guibg=NONE    gui=NONE
" hi Typedef  guifg= guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Special       guifg=#ff8da1 guibg=NONE    gui=NONE
" hi SpecialChar       guifg=#ff8da1 guibg=NONE    gui=NONE
" hi Tag           guifg= guibg=NONE    gui=NONE
" hi Delimiter           guifg= guibg=NONE    gui=NONE
" hi SpecialComment           guifg= guibg=NONE    gui=NONE
" hi Debug           guifg= guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Underlined    guifg=NONE guibg=NONE    gui=underline
" ---------------------------------------------------------------------
" hi Ignore        guifg= guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Error         guifg=#870000 guibg=#ffa40b gui=NONE
" ---------------------------------------------------------------------
hi TODO          guifg=#ff0087 guibg=#ffff87 gui=NONE

" ---------------------------------------------------------------------
" Extended Highlighting

hi NonText       guifg=#838383 guibg=NONE    gui=NONE
hi Visual        guifg=NONE    guibg=#002f53 gui=NONE
hi ErrorMsg      guifg=#870000 guibg=#ffa40b gui=NONE
hi IncSearch     guifg=#262626 guibg=#ff9933 gui=NONE
hi Search        guifg=#262626 guibg=#ff9933 gui=NONE
hi MoreMsg       guifg=#616161 guibg=NONE    gui=NONE
hi ModeMsg       guifg=#616161 guibg=NONE    gui=NONE
hi LineNr        guifg=#838383 guibg=NONE    gui=NONE
hi VertSplit     guifg=#17191a guibg=#17191a gui=NONE
hi VisualNOS     guifg=#262626 guibg=#ffff4d gui=NONE
"hi Folded        guifg=#2e4545 guibg=#1e2d2d gui=NONE
hi Folded        guifg=#00a6ff guibg=#0e111d gui=NONE
hi DiffAdd       guifg=#ffffff guibg=#006600 gui=NONE
hi DiffChange    guifg=#ffffff guibg=#007878 gui=NONE
hi DiffDelete    guifg=#ff0101 guibg=#9a0000 gui=NONE
hi DiffText      guifg=#000000 guibg=#ffb733 gui=NONE
hi SpellBad      guifg=#d80000 guibg=#ffff9a gui=NONE
hi SpellCap      guifg=#8b4600 guibg=#ffff9a gui=NONE
hi SpellRare     guifg=#ff0000 guibg=#ffff9a gui=NONE
hi SpellLocal    guifg=#008b00 guibg=#ffff9a gui=NONE
" hi StatusLine    guifg=#000000 guibg=#8d8d8d gui=NONE
" hi StatusLine    guifg=#ffffff guibg=#2e4545 gui=NONE
" hi StatusLine    guifg=#ffffff guibg=#1e2d2d gui=NONE
" hi StatusLine    guifg=#ffffff guibg=#353535 gui=NONE
" hi StatusLine    guifg=#ffffff guibg=#1f2e2e gui=NONE
" hi StatusLine    guifg=#ffffff guibg=#002b2b gui=NONE
hi StatusLineNC  guifg=#b2b2b2 guibg=#17191a gui=NONE
" hi Pmenu         guifg=#586e75 guibg=#fdf6e3 gui=NONE
" hi PmenuSel      guifg=#fdf6e3 guibg=#2aa198 gui=NONE
" hi PmenuSbar     guifg=#fdf6e3 guibg=#fdf6e3 gui=NONE
" hi PmenuThumb    guifg=#fdf6e3 guibg=#fdf6e3 gui=NONE
" hi Pmenu         guifg=#426464 guibg=#002b2b gui=NONE
" hi Pmenu         guifg=#609292 guibg=#002b2b gui=NONE
hi Pmenu         guifg=#7ca9a9 guibg=#002b2b gui=NONE
hi PmenuSel      guifg=#002b2b guibg=#fdf6e3 gui=NONE
hi PmenuSbar     guifg=#002b2b guibg=#002b2b gui=NONE
hi PmenuThumb    guifg=#002b2b guibg=#002b2b gui=NONE
hi MatchParen    guifg=#000000 guibg=#ff4040 gui=NONE
hi CursorLine    guifg=NONE    guibg=#2e2e2e gui=NONE
"hi CursorLineNr  guifg=#50c878 guibg=#2e2e2e gui=NONE
"hi CursorLineNr  guifg=#3eb489 guibg=NONE    gui=NONE
"hi CursorLineNr  guifg=#f5fffa guibg=NONE    gui=NONE
hi CursorLineNr  guifg=#87ceeb guibg=NONE    gui=NONE
hi CursorColumn  guifg=NONE    guibg=#2e2e2e gui=NONE
hi ColorColumn   guifg=NONE    guibg=#3e3739 gui=NONE
hi WildMenu      guifg=#002b2b guibg=#ffffff gui=NONE
hi SignColumn    guifg=NONE    guibg=#212121 gui=NONE
" }}}

"
"
"
" hi Cursor  guifg=#000000 guibg=#F8F8F0 gui=NONE
" hi Visual  guifg=NONE guibg=#002f53 gui=NONE
" hi CursorLine  guifg=NONE guibg=#000c16 gui=NONE
" hi CursorColumn  guifg=NONE guibg=#000c16 gui=NONE
" hi VertSplit  guifg=#17191a guibg=#17191a gui=NONE
" hi MatchParen  guifg=NONE guibg=#333333
" hi StatusLineNC  guifg=#b2b2b2 guibg=#17191a gui=NONE
" hi Pmenu  guifg=NONE guibg=NONE gui=NONE
" hi PmenuSel  guifg=NONE guibg=#002f53 gui=NONE
" hi IncSearch  guifg=NONE guibg=#5e6068 gui=NONE
" hi Search  guifg=NONE guibg=#5e6068 gui=NONE
" hi Directory  guifg=#A6E22E gui=bold
" hi Folded  guifg=#00a6ff guibg=#0e111d gui=NONE
" 
" hi Normal  guifg=#f4f4ee guibg=#1B1D1E gui=NONE
" hi Boolean  guifg=#a4ed2d guibg=NONE
" hi Character  guifg=#a4ed2d guibg=NONE
" hi Comment  guifg=#465457 guibg=NONE gui=italic
" hi Conditional  guifg=#a4ed2d guibg=NONE
" hi Constant  guifg=#a4ed2d guibg=NONE
" hi Define  guifg=#6497c5 guibg=NONE
" hi ErrorMsg  guifg=#ffffff guibg=#990000 gui=NONE
" hi WarningMsg  guifg=#ffffff guibg=#990000 gui=NONE
" hi Float  guifg=#F8F8F2 guibg=NONE gui=NONE
" hi Function  guifg=#A6E22E guibg=NONE
" hi Identifier  guifg=#6497c5 guibg=NONE
" hi Keyword  guifg=#ffffff guibg=NONE
" hi Label  guifg=#6497c5 guibg=NONE gui=NONE
" hi Number  guifg=NONE guibg=NONE gui=NONE
" hi Operator  guifg=#ffffff guibg=NONE
" hi PreProc  guifg=#A6E22E
" hi PreCondit  guifg=#A6E22E
" hi SignColumn  guifg=#A6E22E guibg=#232526
" hi Special  guifg=#b2b2b2 guibg=NONE gui=NONE
" hi SpecialKey  guifg=#ffb500 guibg=#000c16 gui=NONE
" hi Statement  guifg=#f4f4ee guibg=NONE
" hi StorageClass  guifg=#6497c5  guibg=NONE
" hi String  guifg=#6497c5 guibg=NONE gui=NONE
" hi Tag  guifg=#0065d3 guibg=NONE gui=NONE
" hi Title  guifg=#b2b2b2 guibg=NONE
" hi Todo  guifg=#00a6ff guibg=NONE gui=inverse,bold
" hi Type  guifg=#a4ed2d guibg=NONE gui=NONE
" hi Underlined  guifg=NONE guibg=NONE gui=underline
" hi rubyClass  guifg=#ffffff guibg=NONE
" hi rubyFunction  guifg=#ffca00 guibg=NONE
" hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
" hi rubySymbol  guifg=#a4ed2d guibg=NONE
" hi rubyConstant  guifg=#7a88f6 guibg=NONE
" hi rubyStringDelimiter  guifg=#6497c5 guibg=NONE gui=NONE
" hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
" hi rubyInstanceVariable  guifg=#0068c5 guibg=NONE gui=NONE
" hi rubyInclude  guifg=#ffffff guibg=NONE
" hi rubyGlobalVariable  guifg=#0068c5 guibg=NONE gui=NONE
" hi rubyRegexp  guifg=#6497c5 guibg=NONE gui=NONE
" hi rubyRegexpDelimiter  guifg=#6497c5 guibg=NONE gui=NONE
" hi rubyEscape  guifg=#a4ed2d guibg=NONE
" hi rubyControl  guifg=#ffffff guibg=NONE
" hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
" hi rubyOperator  guifg=#ffffff guibg=NONE
" hi rubyException  guifg=#ffffff guibg=NONE
" hi rubyPseudoVariable  guifg=#0068c5 guibg=NONE gui=NONE
" hi rubyRailsUserClass  guifg=#7a88f6 guibg=NONE
" hi rubyRailsARAssociationMethod  guifg=#815db3 guibg=NONE gui=NONE
" hi rubyRailsARMethod  guifg=#815db3 guibg=NONE gui=NONE
" hi rubyRailsRenderMethod  guifg=#815db3 guibg=NONE gui=NONE
" hi rubyRailsMethod  guifg=#815db3 guibg=NONE gui=NONE
" hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
" hi erubyComment  guifg=#00a6ff guibg=NONE gui=NONE
" hi erubyRailsMethod  guifg=#815db3 guibg=NONE gui=NONE
" hi htmlTag  guifg=NONE guibg=NONE gui=NONE
" hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
" hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
" hi htmlArg  guifg=NONE guibg=NONE gui=NONE
" hi htmlSpecialChar  guifg=#a4ed2d guibg=NONE
" hi javaScriptFunction  guifg=#ffffff guibg=NONE
" hi javaScriptRailsFunction  guifg=#815db3 guibg=NONE gui=NONE
" hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
" hi yamlKey  guifg=#0065d3 guibg=NONE gui=NONE
" hi yamlAnchor  guifg=#0068c5 guibg=NONE gui=NONE
" hi yamlAlias  guifg=#0068c5 guibg=NONE gui=NONE
" hi yamlDocumentHeader  guifg=NONE guibg=#090c15 gui=NONE
" 
" --------- 
" CSS stuff
" ------------------

" hi cssRenderProp guifg=#6497c5 guibg=NONE gui=NONE
" " hi cssURL  guifg=NONE guibg=NONE gui=NONE
" hi cssURL  guifg=#6497c5 guibg=NONE gui=bold
" " hi cssFunctionName  guifg=#815db3 guibg=NONE gui=NONE
" hi cssFunctionName  guifg=#ffffff guibg=NONE gui=NONE
" " hi cssColor  guifg=#a4ed2d guibg=NONE
hi cssTagName         guifg=#a4ed2d guibg=NONE
hi cssProp            guifg=#6497c5 guibg=NONE
hi cssImportant       guifg=#f09f09 guibg=NONE
hi cssFontAttr        guifg=NONE    guibg=NONE gui=NONE
hi cssAttr            guifg=#FFFFFF guibg=NONE
hi cssFlexibleBoxAttr guifg=NONE    guibg=NONE gui=NONE
hi cssBoxAttr         guifg=NONE    guibg=NONE gui=NONE
" hi cssPseudoClass guifg=NONE guibg=NONE gui=italic
hi cssPseudoClassId  guifg=#a4ed2d guibg=NONE gui=italic
" hi cssClassName  guifg=#a4ed2d guibg=NONE gui=NONE
" " hi cssValueLength  guifg=#d70000 guibg=NONE gui=NONE
" hi cssValueLength  guifg=NONE guibg=NONE gui=NONE
" hi cssValueLength  guifg=NONE guibg=NONE gui=NONE
" " hi cssCommonAttr  guifg=#06960e guibg=NONE gui=NONE
" hi cssCommonAttr  guifg=#FFFFFF guibg=NONE gui=NONE
" hi cssBraces  guifg=NONE guibg=NONE gui=NONE
hi cssTextAttr guifg=#ffffff guibg=NONE gui=NONE
hi cssPositioningAttr guifg=NONE guibg=NONE gui=NONE
" hi cssRenderAttr guifg=#ffffff guibg=NONE gui=NONE


" ---------
" Sass customizations
" ------------------------

hi sassClass guifg=#a4ed2d guibg=NONE gui=NONE
hi sassId guifg=#a4ed2d guibg=NONE gui=NONE
hi sassIdChar guifg=#a4ed2d guibg=NONE gui=bold
" hi sassMixinName guifg=#6497c5 guibg=NONE gui=NONE
hi sassMixinName guifg=MediumSlateBlue guibg=NONE gui=NONE
hi sassTagName guifg=purple guibg=NONE gui=NONE
hi sassProperty guifg=#6497c5 guibg=NONE gui=NONE
" hi sassAmpersand guifg=#a4ed2d guibg=NONE gui=NONE
" hi sassFunction guifg=NONE guibg=NONE gui=NONE
" hi sassCssAttribute guifg=#ffffff guibg=NONE gui=NONE
"
"
" ---------
" Django customizations
" ------------------------
"
"
" hi djangoStatement guifg=MediumSlateBlue guibg=NONE gui=NONE



hi NonText guifg=#3a4547 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
" hi LineNr guifg=#3b4647 guibg=#1b1d1e guisp=#1b1d1e gui=NONE ctermfg=238 ctermbg=234 cterm=NONE
hi LineNr guifg=#3b4647 guibg=#191b1c guisp=#2d3039 gui=NONE ctermfg=249 ctermbg=237 cterm=NONE

" vim:foldmethod=marker:foldlevel=0:textwidth=79
"

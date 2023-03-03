" Name:       leaf.vim
" Version:    0.1.0
" Maintainer: github.com/NateDolny
" License:    The MIT License (MIT)
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='leaf'

let s:black           = { "gui": "#000000", "cterm": "232" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }
let s:subtle_black    = { "gui": "#303030", "cterm": "236" }
let s:light_black     = { "gui": "#262626", "cterm": "235" }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" }
let s:light_gray      = { "gui": "#A8A8A8", "cterm": "248" }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251" }
let s:lightest_gray   = { "gui": "#EEEEEE", "cterm": "255" }
let s:dark_green      = { "gui": "#008000", "cterm": "2" }
let s:darkgreen4      = { "gui": "#5faf5f", "cterm": "71" }
let s:red             = { "gui": "#008080", "cterm": "9" }

let s:background = &background

if &background == "dark"
  let s:bg              = s:black
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:medium_gray
  let s:darkgreen4      = s:darkgreen4
  let s:dark_green      = s:dark_green
  let s:green           = s:darkgreen4
  let s:visual          = s:darkgreen4
  let s:darkgreen4      = s:darkgreen4
  let s:red		= s:red
else
  let s:bg              = s:actual_white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lightest_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:medium_gray
  let s:darkgreen4      = s:darkgreen4
  let s:darkgreen4      = s:darkgreen4
  let s:green           = s:dark_green
  let s:visual          = s:darkgreen4
  let s:darkgreen4      = s:darkgreen4
  let s:red		= s:red
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:darkgreen4})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:darkgreen4, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": "italic"})

call s:h("Constant",      {"fg": s:norm})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_green})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:dark_green, "cterm": "bold"})
call s:h("Todo",          {"fg": s:darkgreen4, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:dark_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_green})
call s:h("ErrorMsg",      {"fg": s:white})
call s:h("IncSearch",     {"bg": s:darkgreen4, "fg": s:light_black})
call s:h("Search",        {"bg": s:dark_green, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:norm_subtle})
call s:h("CursorLineNr",  {"fg": s:darkgreen4, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:white})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_green})
call s:h("Visual",        {"fg": s:norm, "bg": s:darkgreen4})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:darkgreen4})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:darkgreen4})
call s:h("DiffText",      {"fg": s:dark_green})
call s:h("SignColumn",    {"fg": s:dark_green})


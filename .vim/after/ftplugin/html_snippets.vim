if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet scri <script type=\"text/javascript\" src=\"".st."path".et."\"></script><CR>".st.et
exec "Snippet sty <link rel=\"stylesheet\" href=\"".st."path".et."\" type=\"text/css\" /><CR>".st.et
exec "Snippet form <form action=\"".st.et."\" method=\"".st.et."\"><CR>".st.et."<CR><CR><input type=\"submit\" value=\"検索\" /><CR></form><CR>".st.et
exec "Snippet input <input type=\"".st.et."\" name=\"".st.et."\" value=\"".st.et."\" /><CR>".st.et
exec "Snippet ta <textarea name=\"".st.et."\" rows=\"".st.et."\" cols=\"".st.et."\">".st.et."</textarea><CR>".st.et
exec "Snippet ref <a href=\"".st.et."\">".st.et."</a>".st.et
exec "Snippet h1 <h1>".st.et."</h1><CR>".st.et
exec "Snippet h2 <h2>".st.et."</h2><CR>".st.et

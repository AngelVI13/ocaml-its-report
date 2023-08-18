let read_file filename =
    In_channel.with_open_text filename In_channel.input_all

let write_file filename contents = 
    Out_channel.with_open_text filename (fun oc -> Out_channel.output_string oc contents)


let doc_template_path = "doc_template.html"
let doc_template = read_file doc_template_path
let doc_template_token = Str.regexp "<!-- REPLACE_CONTENT -->"

let () = 
    let replace_with = "hello" in
    let out = Str.replace_first doc_template_token replace_with doc_template in
    write_file "new_file.html" out

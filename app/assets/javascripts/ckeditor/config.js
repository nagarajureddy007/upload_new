if(typeof(CKEDITOR) != 'undefined')
{
CKEDITOR.editorConfig = function(config) {
   config.uiColor = "#e5e5e5";
   config.toolbar = [
    [ 'Bold', 'Italic', 'Underline', 'Strike' ],
    [ 'NumberedList', 'BulletedList', 'HorizontalRule' ],
    [ 'Blockquote' ],
    [ 'Undo', 'Redo' ],
    [ 'insertResolved' ],
    [ 'Source' ]
];
}
} else{
  console.log("ckeditor not loaded")
}
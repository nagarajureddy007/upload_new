if(typeof(CKEDITOR) != 'undefined')
{
CKEDITOR.editorConfig = function(config) {
   config.uiColor = "#AADC6E";
   config.toolbar = [
    [ 'Bold', 'Italic', 'Underline', 'Strike' ],
    [ 'NumberedList', 'BulletedList', 'HorizontalRule' ],
    [ 'Blockquote' ],
    [ 'Undo', 'Redo' ]
];
}
} else{
  console.log("ckeditor not loaded")
}
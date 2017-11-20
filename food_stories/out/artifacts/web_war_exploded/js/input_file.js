function bs_input_file() {
    $(".input-file").before(
        function() {
            if ( ! $(this).prev().hasClass('input-ghost') ) {
                var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
                element.attr("name",$(this).attr("name"));
                element.change(function(){
                    element.next(element).find('input').val((element.val()).split('\\').pop());
                });
                $(this).find("button.btn-choose").click(function(){
                    element.click();
                });
                $(this).find("button.btn-submit").click(function(){
                    //element.val(null);
                   // $(this).parents(".input-file").find('input').val('');
                    var e = document.createElement('li');
                    e.className = "list-group-item list-group-item-info justify-content-between"
                    e.innerHTML = "<div class=\"checkbox\">\n" +
                        "                                <label><input type=\"checkbox\"> photo1</label>\n" +
                        "                            </div>"
                    document.getElementById('photo_links').appendChild(e);

                });
                $(this).find('input').css("cursor","pointer");
                $(this).find('input').mousedown(function() {
                    $(this).parents('.input-file').prev().click();
                    return false;
                });
                return element;
            }
        }
    );
}
$(function() {
    bs_input_file();
});
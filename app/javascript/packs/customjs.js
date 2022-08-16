$(document).ready(function (){

    $("tr").not(':first').hover(function () {
            $(this).css("background","#e6f7ff ");
        },
        function () {
            $(this).css("background","");
        }
    );

    $(".btn-link").mouseover(function (){
        $('[data-toggle="tooltip"]').tooltip();
    });

})

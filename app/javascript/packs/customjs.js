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

    $(".AddCart").click(function (){
        var productid = $(this).attr("data-id")
        $.ajax({
            url: "/carts",
            type: "POST",
            dataType: "json",
            data: {product_id:productid},
            success: function () {
                console.log("sucesss");
            },
        });
    });

    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file").on('change', function(){
        readURL(this);
    });
    $(".file").on('click', function() {
        $(".this").click();
    });
})

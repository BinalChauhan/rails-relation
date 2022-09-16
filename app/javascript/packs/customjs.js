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
        alert("data save!!")
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

})

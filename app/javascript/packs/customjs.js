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
<<<<<<< HEAD
        alert("consol")
=======
>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
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
<<<<<<< HEAD
=======

>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
})

$(document).ready( function(){

    // If they check a product checkbox, auto-select the first radio button option.
    // If they uncheck a product, de-select the radio button.
    $("input[name^='product-']:checkbox").change(function() {
        if ( $(this).is(':checked') ) {
            var radio = $(this).closest(".act-product").nextUntil(".act-product").filter(":first").find("input:radio");
            radio.attr("checked","checked");
            radio.button("refresh");
        } else {
            $(this).closest(".act-product").nextUntil(".act-product").each( function(){
                $(this).find("input:radio").removeProp('checked');
            });
            $("input:radio").button("refresh");
        }
    });

    // If they select a radio button, make sure the corresponding checkbox is checked.
    $("input[name^='price-']:radio").change(function() {
        if ( ! $(this).is(":checked") ) {
            return false;
        }
        var chkbox = $(this).closest(".act-price").prevUntil(".act-product").prev().find("input:checkbox");

        if ( ! chkbox.is(":checked") ) {
            chkbox.attr("checked","checked");
        }
    });

});

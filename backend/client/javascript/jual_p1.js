if (!localStorage.getItem('LogIn')) {
    window.location.href = '../home/login.html';
}

$(document).ready(function () {
    $(".multi-select").selectpicker();

    var lanjutButton = document.querySelector(".button");

    lanjutButton.addEventListener("click", function (e) {
        e.preventDefault();
        var multiSelectBoxes = document.querySelectorAll(".multi-select-box");

        var selectedItems = [];
        multiSelectBoxes.forEach(function (selectBox) {
            var category = selectBox.querySelector("h2").textContent;
            var select = selectBox.querySelector("select");
            var selectedOptions = select.selectedOptions;
            for (var i = 0; i < selectedOptions.length; i++) {
                var item = selectedOptions[i].textContent;
                selectedItems.push(category + ' / ' + item);
            }
        });

        if (selectedItems.length === 0) {
            alert("Anda belum memilih apapun.");
            return;
        }

        var selectedItemsString = selectedItems.join(',');
        var redirectURL = 'jual_p2.html?selectedItems=' + selectedItemsString;
        window.location.href = redirectURL;
    });
});

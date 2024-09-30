if (!localStorage.getItem('LogIn')) {
    window.location.href = '../home/login.html';
}

document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const selectedItems = urlParams.get("selectedItems");

    if (!selectedItems) {
            window.location.href = 'jual_p1.html';
}

if (selectedItems) {
    const selectedItemsArray = selectedItems.split(',');
    const selectedItemsContainer = document.getElementById("selectedItemsContainer");

    selectedItemsArray.forEach(function (item) {
            const normalizedItem = item.split(' / ').pop().replace(/ /g, '_').toLowerCase();

    const itemContainer = document.createElement("div");
    itemContainer.className = "row justify-content-between";

    itemContainer.innerHTML = `
        <div class="mb-3 col-8">
            <label class="form-label">${item}</label>
            <textarea class="form-control" rows="2" placeholder="Deskripsi Barang"></textarea>
        </div>
        <div class="col-4 end">
            <h3 id="harga-${normalizedItem}">Loading...</h3>
            <div class="wrapper">
                <span class="minus">-</span>
                <span class="num">01</span>
                <span class="plus">+</span>
            </div>
        </div>
    `;

    selectedItemsContainer.appendChild(itemContainer);

            const plus = itemContainer.querySelector(".plus");
    const minus = itemContainer.querySelector(".minus");
    const num = itemContainer.querySelector(".num");
    let a = 1;

    plus.addEventListener("click", () => {
        a++;
                if (a < 10) {
                    num.innerText = "0" + a;
                } else {
                    num.innerText = a;
                }
    });

    minus.addEventListener("click", () => {
        if (a > 1) {
        a--;
                    if (a < 10) { 
        num.innerText = "0" + a;
    } else {
                        num.innerText = a;
                    }
                }
            });

            fetch('../../backend/client/php/ambil_harga.php?selectedItem=' + normalizedItem)
        .then((response) => response.json())
        .then((data) => {
                        if (data.harga !== undefined) {
                itemContainer.querySelector(`#harga-${normalizedItem}`).innerText = 'Rp. ' + data.harga;
            } else {
                console.error('Harga tidak ada dalam respons JSON');
            }
        })
        .catch((error) => {
            console.error('Error saat mengambil data: ' + error.message);
        });
});

        const jualButton = document.getElementById("jualButton");
        jualButton.addEventListener("click", () => {
    const address = document.getElementById("exampleFormControlInput1").value;
    if (!address) {
        alert("Harap isi alamat.");
        return;
    }
    let totalPendapatan = 0;
const itemsToHistoryTambah = {};

    selectedItemsArray.forEach(function (item) {
        const normalizedItem = item.split(' / ').pop().replace(/ /g, '_').toLowerCase();
        const itemContainer = selectedItemsContainer.querySelector(`#harga-${normalizedItem}`).parentNode.parentNode;
        const num = parseInt(itemContainer.querySelector(".num").innerText, 10);
        const harga = parseFloat(itemContainer.querySelector(`#harga-${normalizedItem}`).innerText.replace('Rp. ', '').replace(',', ''));

        totalPendapatan += num * harga;
        itemsToHistoryTambah[normalizedItem] = num;
    });

    const konfirmasi = confirm(`Total Pendapatan: Rp. ${totalPendapatan.toFixed(0)}\n\nPilih 'OK' untuk Lanjutkan atau 'Batal' untuk Batalkan`);
    if (konfirmasi) {
        const formattedTotalPendapatan = totalPendapatan.toFixed(0);
        
                let successCount = 0;
    const showSuccessMessage = () => {
        if (successCount === 3) {
            alert("Transaksi berhasil");
            window.location.href = "dashboard.html";
        }
    };

    fetch('../../backend/client/php/tambah_jual.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `totalPendapatan=${formattedTotalPendapatan}`,
    })
        .then(response => response.text())
        .then(data => {
            if (data === 'sukses') {
                successCount++;
}
showSuccessMessage();

    const dataToHistoryTambah = {
        items: itemsToHistoryTambah
    };
fetch('../../backend/client/php/history_jual.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(dataToHistoryTambah),
    })
        .then(response => response.text())
        .then(data => {
            if (data === 'sukses') {
                successCount++;
}
showSuccessMessage();

    const dataToSend = {
        flow: formattedTotalPendapatan,
        source: 'jual',
        address: address
    };
fetch('../../backend/client/php/history_all.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(dataToSend),
    })
        .then(response => response.text())
        .then(data => {
            if (data === 'sukses') {
successCount++;
                                        }
                showSuccessMessage();
            })
                                    .catch(error => {
                                        console.error('Kesalahan:', error);
                                    });
                            })
                            .catch(error => {
                                console.error('Kesalahan:', error);
                            });
                    })
                    .catch(error => {
                        console.error('Kesalahan:', error);
                    });
}

        });
    }
});

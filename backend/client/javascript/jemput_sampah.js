if (!localStorage.getItem('LogIn')) {
    window.location.href = '../home/login.html';
}

document.addEventListener("DOMContentLoaded", handleJemputButtonClick);

function handleJemputButtonClick() {
    const plus = document.querySelector(".plus");
    const minus = document.querySelector(".minus");
    const num = document.querySelector(".num");
    let a = 1;

    plus.addEventListener("click", () => {
        perbaruiNum(1);
    });

    minus.addEventListener("click", () => {
        perbaruiNum(-1);
    });

    function perbaruiNum(ubah) {
        a += ubah;
        a = Math.max(1, Math.min(a, 99)); 
        num.innerText = a < 10 ? "0" + a : a;
    }

    const jemputButton = document.getElementById("jemputButton");

    jemputButton.addEventListener("click", function () {
        const address = document.getElementById("address").value;
        const sampahOrganik = document.getElementById("Organik").checked;
        const sampahAnorganik = document.getElementById("Anorganik").checked;
        const sampahB3 = document.getElementById("B3").checked;
        const beratSampah = num.innerText;

        if (!address) {
            alert("Harap isi alamat.");
            return;
        } else if (!sampahOrganik && !sampahAnorganik && !sampahB3) {
            alert("Pilih salah satu atau lebih jenis sampah.");
            return;
        }

        fetch("../../backend/client/php/ambil_tarif.php")
            .then(response => response.json())
            .then(data => {
                handleTarifResponse(data, beratSampah, address, sampahOrganik, sampahAnorganik, sampahB3);
            })
            .catch(error => {
                console.error("Error:", error);
            });
    });
}

function handleTarifResponse(data, beratSampah, address, sampahOrganik, sampahAnorganik, sampahB3) {
    if (data.success) {
        const tarif = data.tarif;
        const flow = beratSampah * tarif;
        const konfirmasi = confirm(`Total Pengeluaran: Rp. ${flow.toFixed(0)}\n\nPilih 'OK' untuk Lanjutkan atau 'Batal' untuk Batalkan`);

        if (konfirmasi) {
            const kurangJemputData = {
                flow: flow.toFixed(0),
            };

            fetch('../../backend/client/php/kurang_jemput.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(kurangJemputData),
            })
                .then(response => response.json())
                .then(data => {
                    handleKurangJemputResponse(data, address, sampahOrganik, sampahAnorganik, sampahB3, beratSampah, flow);
                })
                .catch(error => {
                    console.error('Kesalahan:', error);
                });
        }
    } else {
        console.error("Gagal mengambil tarif dari database.");
    }
}

function handleKurangJemputResponse(data, address, sampahOrganik, sampahAnorganik, sampahB3, beratSampah, flow) {
    if (data.success) {
        const jemputSampahData = {
            sampahOrganik: sampahOrganik,
            sampahAnorganik: sampahAnorganik,
            sampahB3: sampahB3,
            beratSampah: beratSampah,
        };

        fetch("../../backend/client/php/jemput_sampah.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jemputSampahData),
        })
            .then(response => response.json())
            .then(data => {
                handleJemputSampahResponse(data, address, flow);
            })
            .catch(error => {
                console.error("Error:", error);
            });
    } else if (data.message === 'Saldo tidak mencukupi') {
        alert("Saldo tidak mencukupi. Transaksi dibatalkan.");
        location.reload();
    }
}

function handleJemputSampahResponse(data, address, flow) {
    if (data.success) {
        const dataToSend = {
            address: address,
            source: 'jemput',
            flow: flow.toFixed(0),
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
                handleResponse(data);
            })
            .catch(error => {
                console.error('Kesalahan:', error);
            });
    } else {
        console.error(data.message);
    }
}

function handleResponse(data) {
    if (data === 'sukses') {
        alert("Transaksi berhasil");
        window.location.href = "dashboard.html";
    } else {
        console.error(data);
    }
}

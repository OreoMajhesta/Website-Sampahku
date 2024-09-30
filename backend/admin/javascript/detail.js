const urlParams = new URLSearchParams(window.location.search);
const id = urlParams.get('id');

fetch('../../backend/admin/php/user.php?id=' + id)
    .then(response => response.json())
    .then(data => {
        const user = data.username;
        const status = urlParams.get('status');
        const address = urlParams.get('address');
        const tanggal = urlParams.get('date');
        const flow = urlParams.get('flow');

        const statusElement = document.querySelector('#status');
        const userElement = document.querySelector('.user');
        const alamatElement = document.querySelector('.alamat');
        const tanggalElement = document.querySelector('.tanggal');
        const flowElement = document.querySelector('.flow');

        statusElement.textContent = status;
        userElement.textContent = user;
        alamatElement.textContent = address;
        tanggalElement.textContent = tanggal;
        flowElement.textContent = flow;
    })
    .catch(error => {
        console.error('Gagal mengambil data user dari PHP:', error);
    });

fetch('../../backend/admin/php/riwayat_barang.php?id=' + id)
    .then(response => response.json())
    .then(data => {
        const list_barang = document.getElementById('list-barang');
            list_barang.innerHTML = ''; 

            data.forEach(row => {
                const totalHarga = row.berat * row.harga;
                list_barang.innerHTML += `
                <div class="row align-items-center">
                    <div class="col">
                        <h4>${row.nama}</h4>
                    </div>
                    <div class="col">
                        <h4>${row.berat} kg</h4>
                    </div>
                    <div class="col">
                        <h4>Rp. ${row.harga}</h4>
                    </div>
                    <div class="col">
                        <h4>${totalHarga}</h4>
                    </div>
                </div>
                `;
            });
    })
    .catch(error => {
        console.error('Gagal mengambil data dari PHP:', error);
    });

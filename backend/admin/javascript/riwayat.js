function formatDate(date) {
    const [year, month, day] = date.split('-');
    return `${day}-${month}-${year}`;
}

function loadHistory() {
    fetch('../../backend/admin/php/riwayat.php')
        .then(response => response.json())
        .then(data => {
            const historyData = document.getElementById('history-data');
            historyData.innerHTML = ''; 

            data.forEach(row => {
                const flowValue = row.status === 'Jemput Sampah' ? `-${row.flow}` : `+${row.flow}`;

                historyData.innerHTML += `
                <div class="row align-items-center">
                    <div class="col">
                        <h4>${row.status}</h4>
                    </div>
                    <div class="col">
                        <h4>${formatDate(row.date)}</h4>
                    </div>
                    <div class="col">
                        <h4>${row.address}</h4>
                    </div>
                    <div class="col">
                        <h4>${flowValue}</h4>
                    </div>
                    <div class="col">
                        <a href="detail.html?id=${row.id}&status=${row.status}&address=${row.address}&date=${formatDate(row.date)}&flow=${flowValue}"><i class="fa-solid fa-circle-chevron-right"></i></a>
                    </div>
                </div>
                `;
            });
        })
        .catch(error => console.error(error));
}
loadHistory();

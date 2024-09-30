if (!localStorage.getItem('LogIn')) {
    window.location.href = '../home/login.html';
}

function formatDate(date) {
    const [year, month, day] = date.split('-');
    return `${day}-${month}-${year}`;
}

function loadHistory() {
    fetch('../../backend/client/php/show_history.php')
        .then(response => response.json())
        .then(data => {
            const historyStatus = document.getElementById('history-status');
            const historyDate = document.getElementById('history-date');
            const historyAddress = document.getElementById('history-address');
            const historyFlow = document.getElementById('history-flow');

            data.forEach(row => {
                const flowValue = row.status === 'Jemput Sampah' ? `-${row.flow}` : `+${row.flow}`;

                historyStatus.innerHTML += `
                    <h4>${row.status}</h4>
                `;
                historyDate.innerHTML += `
                    <h4>${formatDate(row.date)}</h4>
                `;
                historyAddress.innerHTML += `
                    <h4>${row.address}</h4>
                `;
                historyFlow.innerHTML += `
                    <h4>${flowValue}</h4>
                `;
            });
        })
        .catch(error => console.error(error));
}
loadHistory();

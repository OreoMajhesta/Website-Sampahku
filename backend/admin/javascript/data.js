function fetchData() {
    fetch('../../backend/admin/php/data.php') 
        .then(response => response.json())
        .then(data => {
            const dynamicContent = document.getElementById('dynamic-content');

            if (data.length > 0) {
                dynamicContent.innerHTML = ''; 

                data.forEach((rowData, index) => {
                    const noUrut = index + 1; 

                    dynamicContent.innerHTML += `
                        <div class="row align-items-center">
                            <div class="col">
                                <h4>${noUrut}</h4>
                            </div>
                            <div class="col">
                                <h4>${rowData.id}</h4>
                            </div>
                            <div class="col">
                                <h4>${rowData.username}</h4>
                            </div>
                            <div class="col">
                                <h4>${rowData.address}</h4>
                            </div>
                            <div class="col">
                                <h4>${rowData.saldo}</h4>
                            </div>
                        </div>
                    `;
                });
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

fetchData();

async function fetchHarga() {
    try {
        const response = await fetch('../../backend/admin/php/ambil_harga.php'); 
        const data = await response.json();

        document.querySelector('.Handphone').textContent = `Rp. ${data.handphone}`;
        document.querySelector('.Monitor').textContent = `Rp. ${data.monitor}`;
        document.querySelector('.Kulkas').textContent = `Rp. ${data.kulkas}`;
        document.querySelector('.Televisi').textContent = `Rp. ${data.televisi}`;
        document.querySelector('.BateraiAki').textContent = `Rp. ${data.baterai_aki}`;

        document.querySelector('.BotolMineral').textContent = `Rp. ${data.botol_mineral}`;
        document.querySelector('.Jerigen').textContent = `Rp. ${data.jerigen}`;
        document.querySelector('.PlastikCampur').textContent = `Rp. ${data.plastik_campur}`;

        document.querySelector('.Kardus').textContent = `Rp. ${data.kardus}`;
        document.querySelector('.KertasArsip').textContent = `Rp. ${data.kertas_arsip}`;
        document.querySelector('.Duplex').textContent = `Rp. ${data.duplex}`;
        document.querySelector('.KertasBuram').textContent = `Rp. ${data.kertas_buram}`;
        document.querySelector('.SakSemen').textContent = `Rp. ${data.sak_semen}`;

        document.querySelector('.KalengAluminium').textContent = `Rp. ${data.kaleng_alumunium}`;
        document.querySelector('.Besi').textContent = `Rp. ${data.besi}`;
        document.querySelector('.Baja').textContent = `Rp. ${data.baja}`;
        document.querySelector('.Tembaga').textContent = `Rp. ${data.tembaga}`;
        document.querySelector('.Aluminium').textContent = `Rp. ${data.alumunium}`;

        document.querySelector('.BotolSirup').textContent = `Rp. ${data.botol_sirup}`;
        document.querySelector('.BotolCampur').textContent = `Rp. ${data.botol_campur}`;

    } catch (error) {
        console.error('Error fetching data:', error);
    }
}
fetchHarga();


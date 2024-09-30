
if (!localStorage.getItem('LogIn')) {
    window.location.href = '../home/login.html';
}

function logout() {
    localStorage.removeItem('LogIn');
    window.location.href = '../home/login.html';
}

document.addEventListener("DOMContentLoaded", function () {
    fetch("../../backend/client/php/get_user_data.php", {
        method: "GET"
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const userData = data.user;
            document.getElementById("username").textContent = userData.username;
            document.getElementById("saldo").textContent = userData.saldo;
        } else {
            console.error(data.message);
        }
    })
    .catch(error => {
        console.error("Error:", error);
    });
});
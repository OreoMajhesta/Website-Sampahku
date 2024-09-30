document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("loginForm");
    const rememberMe = document.getElementById("rememberMe");
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");

    loginForm.addEventListener("submit", function (e) {
        e.preventDefault();

        const formData = new FormData(loginForm);
        const username = formData.get("username");
        const password = formData.get("password");

        fetch("../../backend/home/php/login.php", {
            method: "POST",
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data.admin) {
                    localStorage.setItem("LogInAdmin", "true");
                    window.location.href = "../admin/admin.html";
                } else if (data.client) {
                    localStorage.setItem("LogIn", "true");
                    window.location.href = "../client/dashboard.html";
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error("Error:", error);
                console.log(error);
            });
    });
});

document.getElementById('forgotPasswordLink').addEventListener('click', function(e) {
    e.preventDefault(); 

    const form = document.getElementById('loginForm'); 
    const username = form.username.value; 
    window.location.href = 'reset_password.html?username=' + encodeURIComponent(username);
});



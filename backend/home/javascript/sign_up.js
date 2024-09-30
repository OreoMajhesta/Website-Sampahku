function isValidEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailRegex.test(email);
}

document.addEventListener("DOMContentLoaded", function() {
    const signUpForm = document.getElementById("signUpForm");
    signUpForm.addEventListener("submit", function(e) {
        e.preventDefault();
        
        const email = signUpForm.email.value;
        if (!isValidEmail(email)) {
            alert("Alamat email tidak valid, Masukkan email dengan contoh :\n example@gmail.com");
        } else {
            const formData = new FormData(signUpForm);
            
            fetch("../../backend/home/php/sign_up.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(respon => {
                handleResponse(respon);
            })
            .catch(error => {
                console.error("Error:", error);
            });
        }
    });

    function handleResponse(respon) {
        const { success, duplicate, duplicate_username, duplicate_email } = respon;
        if (success) {
            alert("Data berhasil disimpan!, Silahkan login");
            signUpForm.reset();
            window.location.href = 'login.html';
        } else if (duplicate) {
            alert("Username dan Email sudah digunakan!");
            signUpForm.reset();
        } else if (duplicate_username) {
            alert("Username sudah digunakan!");
            signUpForm.reset();
        } else if (duplicate_email) {
            alert("Email sudah digunakan!");
            signUpForm.reset();
        } else {
            if (
                !signUpForm.username.value ||
                !signUpForm.password.value ||
                !signUpForm.email.value ||
                !signUpForm.address.value
            ) {
                alert("Semua field harus diisi!");
            } else {
                alert("Gagal menyimpan data. Silakan coba lagi.");
                console.log(respon);
            }
        }
    }
    
});

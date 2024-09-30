if (!localStorage.getItem('LogInAdmin')) {
  window.location.href = '../home/login.html';
}

// Logout
function logout() {
  localStorage.removeItem("LogInAdmin");
  window.location.href = "../home/login.html";
}

const navBar = document.querySelector("nav"),
  menuBtns = document.querySelectorAll(".menu-icon"),
  overlay = document.querySelector(".overlay");

menuBtns.forEach((menuBtn) => {
  menuBtn.addEventListener("click", () => {
    navBar.classList.toggle("open");
  });
});

overlay.addEventListener("click", () => {
  navBar.classList.remove("open");
});

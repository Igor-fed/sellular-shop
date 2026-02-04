const slides = document.querySelectorAll('.slider img');
let current = 0;
const interval = 2500; 

setInterval(() => {
    slides[current].classList.remove('active');
    current = (current + 1) % slides.length;
    slides[current].classList.add('active');
}, interval);

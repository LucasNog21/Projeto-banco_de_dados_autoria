function toggleMenu() {
    document.querySelector('.menu-container').classList.toggle('active');
}
document.addEventListener('click', function(event) {
    const menu = document.querySelector('.menu-container');
    if (!menu.contains(event.target)) {
        menu.classList.remove('active');
    }
});

function checkValue(input){
    if (input.value.trim() !== ''){
        input.classList.add('has-value');
    } else {
        input.classList.remove('has-value');
    }
}

let login_btn = document.querySelector("#login_btn");
const LOGIN_CONTAINER = document.querySelector("body");
async function handleLogin(){
    params = new URLSearchParams();
    params.append('type', 'get_login_form');
    await fetch('request', {
        method:"POST",
        body: params
    })
    .then(Response=> Response.text())
    .then(html=> LOGIN_CONTAINER.innerHTML+=html)
    const CLOSE_BTN = document.getElementById("close_form")
    CLOSE_BTN.addEventListener('click', closeLogin)
}
function closeLogin(){
    let FORM_CONTAINER = document.querySelector(".login_container")
    FORM_CONTAINER.remove()
    let login_btn = document.querySelector("#login_btn");
    login_btn.addEventListener('click', handleLogin)
    const EVENT = new CustomEvent('login_closed');
    document.dispatchEvent(EVENT)
}
login_btn.addEventListener('click', handleLogin)



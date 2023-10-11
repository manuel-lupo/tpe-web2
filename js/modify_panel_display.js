function handleListeners(){
    let album_select = document.querySelector('#album_select');
    album_select.addEventListener('change', async function(e){
        let album_container = document.querySelector('.modify_container');
        let params = new URLSearchParams();
        params.append('type' , 'get_modify_panel')
        params.append('id' , this.value)
        await fetch('request' , {
            method:'POST',
            body: params
        })
        .then(response => response.text())
        .then(html => album_container.innerHTML = html)
    })
    document.addEventListener('login_closed', handleListeners);
}
handleListeners()
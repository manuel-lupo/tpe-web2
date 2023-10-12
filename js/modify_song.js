function handleListeners(){
    let song_select = document.querySelector('#song_select');
    song_select.addEventListener('change', async function(e){
        let song_container = document.querySelector('.modify_container');
        let params = new URLSearchParams();
        params.append('type' , 'get_modify_song')
        params.append('id' , this.value)
        await fetch('request' , {
            method:'POST',
            body: params
        })
        .then(response => response.text())
        .then(html => song_container.innerHTML = html)
    })
    document.addEventListener('login_closed', handleListeners);
}
handleListeners()
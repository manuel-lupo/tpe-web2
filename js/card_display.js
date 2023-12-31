function handleListeners(){
    let ALBUM_ROWS = document.querySelectorAll('#album_row');
    ALBUM_ROWS.forEach(row => {
        row.addEventListener('click' , function(e){
            let CARD_DISPLAY = document.querySelector('.card_container');
            params = new URLSearchParams();
            params.append('id' , this.dataset.id);
            params.append('type', 'get_album_card');
            fetch(`request` , {
                method: 'POST',
                body: params
            })
            .then(response => response.text())
            .then(html => CARD_DISPLAY.innerHTML = html);
        })
    });
    document.addEventListener('login_closed', handleListeners);
}
handleListeners()

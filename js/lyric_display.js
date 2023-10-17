function handleListeners(){
    let song_rows = document.querySelectorAll("#song_row");
    song_rows.forEach(row => {
        row.addEventListener('click', function(e){
            console.log(this);
            let lyric_display = document.querySelector(".song_search_result");
            params = new URLSearchParams();
            params.append('id' , this.dataset.id);
            params.append('type', 'get_song_lyric');
            fetch('request',{
                method:"POST",
                body:params
            })
            .then(response => response.text())
            .then(html => lyric_display.innerHTML = html);
        })
    })

    document.addEventListener('login_closed', handleListeners);
}

handleListeners();
const api_url = "https://sheetdb.io/api/v1/8eb2ys5rqwxbc2"
const api_backup = "./backup_db.json"


fetch(api_url)
    .then(res => {
        if (res.status != 200) {
            console.log("solo cuando hay un status distinto al 200")
            fetch(api_backup)
                .then(res => res.json())
            return res.json()
        }

        console.log("tomado desde la api")

        return res.json()

    }
    )
    .then(data => console.log(data))
    .catch(error => {
        console.log("data -> No data but backup")
        fetch(api_backup)
        .then(res => res.json())
        .then(data => console.log(data))
    })



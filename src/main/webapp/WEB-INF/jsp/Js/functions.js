const button = document.getElementById("update");
const temp1 = document.getElementById("password");
const temp2 = document.getElementById("NPassword");
const temp3 = document.getElementById("CPassword");

function enabled() {
    button.disabled = false
}

function showPassword() {

    if (temp1.type === "password" && temp2.type === "password" && temp3.type === "password") {
        temp1.type = "text";
        temp2.type = "text";
        temp3.type = "text";
    } else {

        temp1.type = "password";
        temp2.type = "password";
        temp3.type = "password";

    }
}

function disabled() {
    button.disabled = true
}

const buttonUpdate = document.getElementById("updateP");

function enabledP() {

    buttonUpdate.disabled = false
}

function anb_dsb_file(name) {
    const buttonUpdate = document.getElementById(name);
    if (buttonUpdate.disabled) {
        buttonUpdate.disabled = false;
    } else {
        buttonUpdate.ariaRequired;
        buttonUpdate.disabled = true;
    }
}

function disabledP() {

    buttonUpdate.disabled = true
}


async function sendFile(idName) {
    try {


            const inpFile = document.querySelector('#' + idName)
            const file = inpFile?.files[0]
            const formData = new FormData()
            formData.append('file', file)

            const response = await fetch('/searchImg', {
                method: 'POST',
                body: formData
            })

        console.log('imgs response : ', response)
    } catch (e) {
        console.error(e)
    }
}


async function onSelectImg(imgUrl) {
    const response = await fetch('/save/img', {
        method: 'POST',
        headers: {
            'content-type': 'application/json'
        },
        body: JSON.stringify({imgUrl})
    })
    console.log(response)
}


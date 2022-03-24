const username = document.getElementById("usrname");
const password = document.getElementById("psw");
const conPassword = document.getElementById("c-psw");
const email = document.getElementById("email");
const sub = document.getElementById("submit");

username.addEventListener('input', function(e) {
	var regex1 = /^[a-zA-Z ]{2,30}$/;
	if (!regex1.test(e.target.value)) {
		sub.disabled = true;
		email.disabled = true;
		password.disabled = true;
		conPassword.disabled = true;
		
	}
	else {
		email.disabled = false;
		email.addEventListener('input', function(e) {
			var regex2 = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if (!regex2.test(e.target.value)) {
				password.disabled = true;
				conPassword.disabled = true;
				sub.disabled = true;

			}
			else {
				password.disabled = false;
				conPassword.disabled = false;
			}
		}
		)
	}
})

email.addEventListener('input', function(e) {
	var regex2 = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (!regex2.test(e.target.value)) {
		msg.style.display = 'block';
		password.disabled = true;
		conPassword.disabled = true;

	}
	else {
		msg.style.diplay = 'block';
		password.disabled = false;
		conPassword.disabled = false;
	}
}
)


function check() {
	if (document.getElementById("psw").value == document.getElementById("c-psw").value) {
		document.getElementById("msg").innerHTML = "match"
		document.getElementById("submit").disabled = false;
	}
	else {
		document.getElementById("submit").disabled = true;
		document.getElementById("msg").innerHTML = "no match"
	}
}



/**
 * 
 */
 const email = document.getElementById('email');
 const password = document.getElementById('psw');
 const error = document.getElementById('msg');

email.addEventListener('input',function(e)
{
	var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    console.log(e.target.value);
	if(!regex.test(e.target.value)){
		error.style.display = 'block';
		password.disabled = true;
		
	}
	else{
		
		password.disabled = false;
        error.style.display='none';
	}
	
	
}



)
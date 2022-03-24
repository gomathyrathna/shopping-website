function checkLuhn(cardNo)
    {
        let nDigits = cardNo.length;
 
        let nSum = 0;
        let isSecond = false;
        for (let i = nDigits - 1; i >= 0; i--)
        {
 
            let d = cardNo[i].charCodeAt() - '0'.charCodeAt();
 
            if (isSecond == true)
                d = d * 2;
 
            // We add two digits to handle
            // cases that make two digits
            // after doubling
            nSum += parseInt(d / 10, 10);
            nSum += d % 10;
 
            isSecond = !isSecond;
        }
        return (nSum % 10 == 0);
    }

  
const creditCardNumber= document.getElementById("credit-card-number");
const creditCardNumberError= document.getElementById("credit-card-number-error");
const cardName =document.getElementById("credit-card-name");
const cardNameError =document.getElementById("credit-card-name-error");
const cardCvv =document.getElementById("credit-card-cvv");
const cardCvvError =document.getElementById("credit-card-cvv-error");
const sub = document.getElementById('submit');

cardName.addEventListener("input", function (e) {
  var regex = /^[a-zA-Z ]{2,30}$/;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    cardNameError.style.display = "block";
    cardName.style.boxShadow = "0 0 5px 5px red";
    creditCardNumber.disabled = true;
      cardExpiration.disabled = true;
          cardCvv.disabled = true;
          sub.disabled = true;

  } else {
    cardNameError.style.display = "none";
    cardName.style.boxShadow = "0 0 0 0";
    creditCardNumber.disabled = false;
  cardExpiration.disabled = false;
     cardCvv.disabled = false;
   sub.disabled = false;
  }
});


creditCardNumber.addEventListener('input',function(e){
	 e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
	if(!checkLuhn(e.target.value)){
		console.log(checkLuhn(e.target.value));
		creditCardNumberError.style.display ='block';
		creditCardNumber.style.boxShadow ="0 0 5px 5px red";
		cardName.disabled = true;
		cardExpiration.disabled = true;
		    cardCvv.disabled = true;
		    sub.disabled = true;
	}
	else{
		creditCardNumberError.style.display ='none';
		creditCardNumber.style.boxShadow ="0 0 0 0 ";
		    cardName.disabled = false;
		    cardExpiration.disabled = false;
		       cardCvv.disabled = false;
		       sub.disabled = false;
	}
})

cardCvv.addEventListener("input", function (e) {
  var regex = /^[0-9]{3,4}$/ ;
  console.log(e.target.value);
  if (!regex.test(e.target.value)) {
    cardCvvError.style.display = "block";
    cardCvv.style.boxShadow = "0 0 5px 5px red";
	cardName.disabled = true;
	    creditCardNumber.disabled = true;
	    cardExpiration.disabled= true;
	    cardCvv.disabled = true;
	    sub.disabled = true;
  } else {
    cardCvvError.style.display = "none";
    cardCvv.style.boxShadow = "0 0 0 0";
cardName.disabled = false;
     creditCardNumber.disabled = false;
         cardExpiration.disabled= false;
         sub.disabled = false;
  }
});
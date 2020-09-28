
	function validateForm() {
		var noValidation = document.getElementById("#altaUsuario").novalidate;
		
		if (!noValidation){
			var error1 = passwordValidation();
	        
			var error2 = passwordConfirmation();
	        
			return (error1.length==0) && (error2.length==0);
		}
		else 
			return true;
	}

	function passwordValidation(){
		var password = document.getElementById("PASS");
		var pwd = password.value;
		var valid = true;

		valid = valid && (pwd.length>=6);
		
		var hasNumber = /\d/;
		valid = valid && (hasNumber.test(pwd));
		
		if(!valid){
			var error = "Please enter a valid password! Length >= 6 with digits and letters";
		}else{
			var error = "";
		}
	        password.setCustomValidity(error);
		return error;
	}
	
	function passwordConfirmation(){
        var password = document.getElementById("pass");
		var pwd = password.value;
		var passconfirm = document.getElementById("CONFIRMPASS");
		var confirmation = passconfirm.value;

		if (pwd != confirmation) {
			var error = "Please enter matching passwords!";
		}else{
			var error = "";
		}

		passconfirm.setCustomValidity(error);

		return error;
	}

	function passwordStrength(password){
    		var letters = {};

    		var length = password.length;
    		for(x = 0, length; x < length; x++) {
        		var l = password.charAt(x);


        		letters[l] = (isNaN(letters[l])? 1 : letters[l] + 1);
    		}


    		return Object.keys(letters).length / length;
	}
	
	function passwordColor(){
		var passField = document.getElementById("pass");
		var strength = passwordStrength(passField.value);
		
		if(!isNaN(strength)){
			var type = "weakpass";
			if(passwordValidation()!=""){
				type = "weakpass";
			}else if(strength > 0.7){
				type = "strongpass";
			}else if(strength > 0.4){
				type = "middlepass";
			}
		}else{
			type = "nanpass";
		}
		passField.className = type;
		
		return type;
	}
	

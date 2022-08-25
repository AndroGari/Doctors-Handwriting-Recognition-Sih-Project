import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { getAuth, sendEmailVerification } from "firebase/auth";
import { Form, Alert } from "react-bootstrap";
import { Button } from "react-bootstrap";
import { useUserAuth } from "../context/UserAuthContext";
import {addDoc, collection} from "firebase/firestore";

import "./Login.css";
import TagIcon from "@mui/icons-material/Tag";
import TextField from "@mui/material/TextField";
import IconButton from "@mui/material/IconButton";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import InputAdornment from "@mui/material/InputAdornment";
import VisibilityIcon from "@mui/icons-material/Visibility";
import VisibilityOffIcon from "@mui/icons-material/VisibilityOff";

const Signup = (props) => {
  const [email, setEmail] = useState("");
  const[name ,setName] =useState("");
  const[phone,setPhone] =useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [phoneError, setPhoneError] = useState("");
  const [focused, setFocused] = useState(false);
  const [errorStudentType, setErrorStudentType] = useState(false);
  const [errorStudentName, setErrorStudentName] = useState(false);
  const [errorStudentPhone, setErrorStudentPhone] = useState(false);
  const [PasswordErrorType, setPasswordErrorType] = useState(false);
  const [emailError, setEmailError] = useState("");
  const [nameError, setNameError] = useState("");
  const [passwordError, setPasswordError] = useState("");
  const [eye, setEye] = useState(false);
  const [visibleIcon, setVisibleIcon] = useState(false);
  const { signUp } = useUserAuth();
  let navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();



    await addDoc(collection(props.db,"users"),
    
    {
      email:email,
      name:name,
      phone:phone
  
    }).then(function(res){
alert("Data added Successfully")
    }).catch(function(err){
      alert("Data can't be added");
    })

    setError("");
    try {
      await signUp(email, password);
      const auth = getAuth();
      sendEmailVerification(auth.currentUser)
        .then(() => {
          // Email verification sent!
          // ...
        });
       
      console.log(auth.currentUser.email);
         if(auth.currentUser.emailVerified==="true") {
        navigate("/home")
         }
                  
                else{
                  navigate("/");
                }

      
    } catch (err) {
      setError(err.message);
    }
  };



  const validateEmail = (value) => {
    let error;
    const regex = new RegExp("[a-z0-9]+@gmail.com")
    if (!value) {
      error = "Email is required !!";
      setErrorStudentType(true);
    } else if (!regex.test(value)) {
      error = "google mail id is required !!!";
      setErrorStudentType(true);
    } else {
      setErrorStudentType(false);
    }
    return error;
  };

  const validatePassword = (value) => {
    let error;
    const regex = /^[A-Za-z]{3,}[@][0-9]{7}$/;
    if (!value) {
      error = "Password is required";
      setPasswordErrorType(true);

    } else if (!regex.test(value)) {
      error = "Password is incorrect";
      setPasswordErrorType(true);

    } else {
      setPasswordErrorType(false);
  
    }
    return error;
  };

  const validateName = (value)=>{
    let error;
    let regex = new RegExp("^[A-Za-z ]{3,29}$");
    if(!value)
    {
      error ="name is required";
      setErrorStudentName(true);
    }
    else if(!regex.test(value)){
      error ="name should be of minimum 3 characters";
      setErrorStudentName(true);
    }
    else{
      setErrorStudentName(true);
    }
    return error;
  }
const validatePhone =(value)=>{
  let error;
  const regex ="^[0-9]{10}$";
  if(!value)
  {
    error ="Phone Number is required!!!";
    setErrorStudentPhone(true);
  }
  else if (!regex.test(value)){
    error ="Phone number should include 10 digits";
    setErrorStudentPhone(true);
  }
  else {
    setErrorStudentPhone(true);
  }
  return error;
}

  const studentFocus = (e) => {
    setFocused(true);
    setEmailError(validateEmail(email));
  };
  const studentFocusPhone = (e) => {
    setFocused(true);
    setPhoneError(validatePhone(phone));
  };
  const studentFocusName = (e) => {
    setFocused(true);
    setNameError(validateName(name));
  };
  const passwordFocus = (e) => {
    setFocused(true);
    setPasswordError(validatePassword(password));
  };

  const seen = () => {
    setEye(!eye);
    setVisibleIcon(!visibleIcon);
  };

  return (
    <>
      <div className="p-4 box">
        <h2 className="mb-3 headingclass"> Signup</h2>
        {error && <Alert variant="danger">{error}</Alert>}
        <Form onSubmit={handleSubmit}>
          


        <div className="icon_container">
          <div className="icon">
            <p className="bars"></p>
            <TagIcon />
          </div>
          <TextField
           autoComplete="off"
            label="name"
            variant="outlined"
            size="small"
            className="input_field"
            type="text"
            name="studentName"
            error={errorStudentName ? true : false}
            onBlur={studentFocusName}
            focused={focused.tostring}
            value={name}
            onChange={(e) => setName(e.target.value)}
            inputProps={{ style: { fontSize: 15 } }} // font size of input text
            InputLabelProps={{ style: { fontSize: 15 } }} // font size of input label
          />
        </div>
        <div className="errormsg_container">
          <div className="errormsg">
            <span>{nameError}</span>
          </div>
        </div>


        <div className="icon_container">
          <div className="icon">
            <p className="bars"></p>
            <TagIcon />
          </div>
          <TextField
            autoComplete="off"
            label="Email"
            variant="outlined"
            size="small"
            className="input_field"
            type="text"
            name="studentNum"
            error={errorStudentType ? true : false}
            onBlur={studentFocus}
            focused={focused.tostring}
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            inputProps={{ style: { fontSize: 15 } }} // font size of input text
            InputLabelProps={{ style: { fontSize: 15 } }} // font size of input label
          />
        </div>
        <div className="errormsg_container">
          <div className="errormsg">
            <span>{emailError}</span>
          </div>
        </div>






        <div className="icon_container">
          <div className="icon">
            <p className="bars"></p>
            <TagIcon />
          </div>
          <TextField
            autoComplete="off"
            label="mobileNo"
            variant="outlined"
            size="small"
            className="input_field"
            type="text"
            name="studentName"
            error={errorStudentPhone ? true : false}
            onBlur={studentFocusPhone}
            focused={focused.tostring}
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            inputProps={{ style: { fontSize: 15 } }} // font size of input text
            InputLabelProps={{ style: { fontSize: 15 } }} // font size of input label
          />
        </div>
        <div className="errormsg_container">
          <div className="errormsg">
            <span>{phoneError}</span>
          </div>
        </div>





        <div className="icon_container">
          <div className="icon">
            <p className="bars"></p>
            <LockOutlinedIcon />
          </div>
          <TextField
            autoComplete="off"
            my={10}
            label="Password"
            name="password"
            variant="outlined"
            size="small"
            className="input_field"
            error={PasswordErrorType ? true : false}
            onBlur={passwordFocus}
            focused={focused.tostring}
            type={eye ? "text" : "password"}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            // font size of input text
            InputLabelProps={{ style: { fontSize: 15 } }} // font size of input label
            InputProps={{
              endAdornment: (
                <InputAdornment position="end">
                  <IconButton onClick={seen}>
                    {visibleIcon ? <VisibilityIcon /> : <VisibilityOffIcon />}
                  </IconButton>
                </InputAdornment>
              ),
              style: { fontSize: 15 },
            }}
          />
        </div>
        <div className="errormsg_container">
          <div className="errormsg">
            <span>{passwordError}</span>
          </div>
        </div>







          <div className="d-grid gap-2">
            <Button variant="primary" type="Submit">
              Sign up
            </Button>
          </div>
        </Form>
      </div>
      <div className="p-4 box mt-3 text-center">
        Already have an account? <Link to="/">Log In</Link>
      </div>
    </>
  );
};

export default Signup;
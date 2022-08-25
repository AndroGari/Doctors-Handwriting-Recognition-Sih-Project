// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {getAuth} from "firebase/auth";
import { getFirestore } from "firebase/firestore";
 
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: process.env.REACT_APP_API_KEY,
  authDomain: "swasthyavardhak-suvarna.firebaseapp.com",
  projectId: "swasthyavardhak-suvarna",
  storageBucket: "swasthyavardhak-suvarna.appspot.com",
  messagingSenderId: "334271834125",
  appId: "1:334271834125:web:2811b5797e6deb9357cd44"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const auth =getAuth(app);
const db=getFirestore(app);
export default app;